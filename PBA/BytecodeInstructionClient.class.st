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

	stackPops := stackPops + 1
]

{ #category : 'as yet unclassified' }
BytecodeInstructionClient >> dumpResult: aResult [

	aResult at: 'totalExecutedBlocks' put: self totalExecutedBlocks.
	aResult at: 'differentExecutedBlocks' put: self differentExecutedBlocks.
	aResult at: 'differentCallSites' put: self differentCallSites.
	aResult at: 'totalExecutedBytecodes' put: self totalExecutedBytecodes.
	aResult at: 'differentExecutedBytecodes' put: self differentExecutedBytecodes.
	aResult at: 'totalMethodsCalled' put: self totalMethodsCalled.
	aResult at: 'differentMethodsCalled' put: self differentMethodsCalled.
	aResult at: 'totalExecutedLoops' put: self totalExecutedLoops.
	aResult at: 'avgArguments' put: self avgArguments.
	
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

{ #category : 'instruction decoding' }
BytecodeInstructionClient >> pc: aBytecode [
	
	executedBytecodes at: self currentBytecode update: [ :old | old + 1 ] initial: 1
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
BytecodeInstructionClient >> send: selector super: supered numArgs: numberArguments [

	| sender method |
	
	sender := profiler context sender.
	method := profiler context method.

	method isCompiledBlock ifTrue: [
		executedBlocks at: method update: [ :old | old + 1 ] initial: 1.
	].
	
	sender ifNotNil: [
		callSites at: ((sender asString), self currentBytecode asString) update: [ :old | old + 1 ] initial: 1
	].

	(self isArrayAccess: method) ifTrue: [ arrayAccesses := arrayAccesses + 1 ].

	executedMethods at: method update: [ :old | old + 1 ] initial: 1.
	totalArguments := totalArguments + numberArguments.
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
