Class {
	#name : 'BytecodeInstructionClient',
	#superclass : 'InstructionClient',
	#instVars : [
		'profiler',
		'executedBlocks',
		'callSites',
		'executedBytecodes',
		'executedMethods',
		'totalArguments',
		'stackPushs',
		'stackPops',
		'arrayAccesses'
	],
	#category : 'PBA-BytecodeProfiler',
	#package : 'PBA',
	#tag : 'BytecodeProfiler'
}

{ #category : 'accessing' }
BytecodeInstructionClient >> avgArguments [

	^  (totalArguments / self totalMethodsCalled) asFloat round: 3
]

{ #category : 'accessing' }
BytecodeInstructionClient >> currentBytecode [ 
	
	^ profiler context pc - 1
]

{ #category : 'as yet unclassified' }
BytecodeInstructionClient >> differentCallSites [

	^ callSites keys size
]

{ #category : 'as yet unclassified' }
BytecodeInstructionClient >> differentExecutedBlocks [

	^ executedBlocks keys size
]

{ #category : 'as yet unclassified' }
BytecodeInstructionClient >> differentExecutedBytecodes [

	^ executedBytecodes keys size
]

{ #category : 'as yet unclassified' }
BytecodeInstructionClient >> differentMethodsCalled [

	^ executedMethods keys size
]

{ #category : 'instruction decoding' }
BytecodeInstructionClient >> doPop [

	self stackPop
]

{ #category : 'as yet unclassified' }
BytecodeInstructionClient >> dumpResult: aResult [

	aResult merge: (Dictionary newFrom: {
		'totalExecutedBlocks' -> self totalExecutedBlocks.
		'differentExecutedBlocks' -> self differentExecutedBlocks.
		'differentCallSites' -> self differentCallSites.
		'totalExecutedBytecodes' -> self totalExecutedBytecodes.
		'differentExecutedBytecodes' -> self differentExecutedBytecodes.
		'totalMethodsCalled' -> self totalMethodsCalled.
		'differentMethodsCalled' -> self differentMethodsCalled.
		'totalExecutedLoops' -> self totalExecutedLoops.
		'avgArguments' -> self avgArguments.
	})
	
]

{ #category : 'initialization' }
BytecodeInstructionClient >> initialize [

	super initialize.
	executedBlocks := Dictionary new.
	callSites := Dictionary new.
	executedBytecodes := Dictionary new.
	executedMethods := Dictionary new.
	totalArguments := 0.
	arrayAccesses := 0.
	stackPushs := 0.
	stackPops := 0.
]

{ #category : 'instruction decoding' }
BytecodeInstructionClient >> isArrayAccess: method [

	^ method = (Array >> #at:)
]

{ #category : 'as yet unclassified' }
BytecodeInstructionClient >> methodToCall: selector numArgs: numArgs [ 
	

	^ (self receiverToCall: numArgs) class lookupSelector: selector
]

{ #category : 'instruction decoding' }
BytecodeInstructionClient >> pc: aBytecode [
	
	executedBytecodes at: self currentBytecode update: [ :old | old + 1 ] initial: 1
]

{ #category : 'instruction decoding' }
BytecodeInstructionClient >> popIntoLiteralVariable: anAssociation [

	self stackPop
]

{ #category : 'instruction decoding' }
BytecodeInstructionClient >> popIntoReceiverVariable: offset [

	self stackPop
]

{ #category : 'instruction decoding' }
BytecodeInstructionClient >> popIntoRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex [

	self stackPop
]

{ #category : 'instruction decoding' }
BytecodeInstructionClient >> popIntoTemporaryVariable: offset [

	self stackPop
]

{ #category : 'accessing' }
BytecodeInstructionClient >> profiler: aProfiler [

	profiler := aProfiler 
]

{ #category : 'instruction decoding' }
BytecodeInstructionClient >> pushActiveContext [
	
	self stackPush
]

{ #category : 'instruction decoding' }
BytecodeInstructionClient >> pushActiveProcess [
	
	self stackPush
]

{ #category : 'instruction decoding' }
BytecodeInstructionClient >> pushClosureTemps: numTemps [
	
	self stackPush
]

{ #category : 'instruction decoding' }
BytecodeInstructionClient >> pushConsArrayWithElements: numElements [
	
	self stackPush
]

{ #category : 'instruction decoding' }
BytecodeInstructionClient >> pushConstant: value [
	
	self stackPush
]

{ #category : 'instruction decoding' }
BytecodeInstructionClient >> pushFloat32ArrayToRegister [
	
	self stackPush
]

{ #category : 'instruction decoding' }
BytecodeInstructionClient >> pushFloat64ArrayToRegister [
	
	self stackPush
]

{ #category : 'instruction decoding' }
BytecodeInstructionClient >> pushFullClosure: aCollection numCopied: anInteger receiverOnStack: aFalse ignoreOuterContext: aFalse4 [
	
	self stackPush
]

{ #category : 'instruction decoding' }
BytecodeInstructionClient >> pushLiteralVariable: anAssociation [
	
	self stackPush
]

{ #category : 'instruction decoding' }
BytecodeInstructionClient >> pushNewArrayOfSize: numElements [
	
	self stackPush
]

{ #category : 'instruction decoding' }
BytecodeInstructionClient >> pushReceiver [
	
	self stackPush
]

{ #category : 'instruction decoding' }
BytecodeInstructionClient >> pushReceiverVariable: offset [
	
	self stackPush
]

{ #category : 'instruction decoding' }
BytecodeInstructionClient >> pushRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex [
	
	self stackPush
]

{ #category : 'instruction decoding' }
BytecodeInstructionClient >> pushTemporaryVariable: offset [
	
	self stackPush
]

{ #category : 'instruction decoding' }
BytecodeInstructionClient >> receiverToCall: numberArguments [

	^ profiler context stackAt: numberArguments
]

{ #category : 'instruction decoding' }
BytecodeInstructionClient >> send: selector super: supered numArgs: numberArguments [

	| sender caller methodToCall receiverToCall |
	
	sender := profiler context sender.
	caller := profiler context method.
	receiverToCall := self receiverToCall: numberArguments.
	methodToCall := self methodToCall: selector numArgs: numberArguments.
	
	receiverToCall isBlock ifTrue: [
		executedBlocks at: receiverToCall update: [ :old | old + 1 ] initial: 1.
	].
	
	caller ifNotNil: [
		callSites at: ((caller asString), self currentBytecode asString) update: [ :old | old + 1 ] initial: 1
	].

	(self isArrayAccess: methodToCall) ifTrue: [ arrayAccesses := arrayAccesses + 1 ].

	executedMethods at: methodToCall update: [ :old | old + 1 ] initial: 1.
	totalArguments := totalArguments + numberArguments.
]

{ #category : 'instruction decoding' }
BytecodeInstructionClient >> stackPop [

	stackPops := stackPops + 1
]

{ #category : 'instruction decoding' }
BytecodeInstructionClient >> stackPush [

	stackPushs := stackPushs + 1
]

{ #category : 'as yet unclassified' }
BytecodeInstructionClient >> totalExecutedBlocks [

	^ executedBlocks values sum
]

{ #category : 'accessing' }
BytecodeInstructionClient >> totalExecutedBytecodes [
	
	^ executedBytecodes values sum
]

{ #category : 'accessing' }
BytecodeInstructionClient >> totalExecutedLoops [

	^ executedMethods keys inject: 0 into: [ :r :method |
		method isLoop ifTrue: [ r + executedMethods at: method ] ifFalse: [ r ]
	]
]

{ #category : 'accessing' }
BytecodeInstructionClient >> totalMethodsCalled [

	^ executedMethods values sum
]
