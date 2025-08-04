Class {
	#name : 'BytecodeInstructionClient',
	#superclass : 'InstructionClient',
	#instVars : [
		'profiler',
		'executedBlocks',
		'callSites',
		'executedBytecodes',
		'executedMethods',
		'totalArguments'
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
BytecodeInstructionClient >> send: selector super: supered numArgs: numberArguments [

	| sender |
	
	sender := profiler context sender.

	profiler context method isCompiledBlock ifTrue: [
		executedBlocks at: (profiler context method) update: [ :old | old + 1 ] initial: 1.
	].
	
	sender ifNotNil: [
		callSites at: ((sender asString), self currentBytecode asString) update: [ :old | old + 1 ] initial: 1
	].

	executedMethods at: profiler context method update: [ :old | old + 1 ] initial: 1.
	totalArguments := totalArguments + numberArguments
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
