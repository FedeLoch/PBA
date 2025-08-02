Class {
	#name : 'ExecutedBytecodesTracker',
	#superclass : 'BytecodeInstructionClient',
	#instVars : [
		'executedBytecodes'
	],
	#category : 'PBA-BytecodeProfiler',
	#package : 'PBA',
	#tag : 'BytecodeProfiler'
}

{ #category : 'as yet unclassified' }
ExecutedBytecodesTracker >> differentExecutedBytecodes [

	^ executedBytecodes keys size
]

{ #category : 'as yet unclassified' }
ExecutedBytecodesTracker >> dumpResult: aResult [

	aResult at: 'totalExecutedBytecodes' put: self totalExecutedBytecodes.
	aResult at: 'differentExecutedBytecodes' put: self differentExecutedBytecodes
]

{ #category : 'instruction decoding' }
ExecutedBytecodesTracker >> initialize [

	super initialize.
	executedBytecodes := Dictionary new.
]

{ #category : 'instruction decoding' }
ExecutedBytecodesTracker >> pc: aBytecode [
	
	executedBytecodes at: aBytecode update: [ :old | old + 1 ] initial: 1
]

{ #category : 'accessing' }
ExecutedBytecodesTracker >> totalExecutedBytecodes [
	
	^ executedBytecodes values sum
]
