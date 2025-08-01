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

{ #category : 'instruction decoding' }
ExecutedBytecodesTracker >> initialize [

	super initialize.
	executedBytecodes := Dictionary new.
]

{ #category : 'instruction decoding' }
ExecutedBytecodesTracker >> pc: aBytecode [
	
	executedBytecodes at: aBytecode update: [ :old | old + 1 ] initial: 1
]
