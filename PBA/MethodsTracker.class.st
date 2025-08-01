Class {
	#name : 'MethodsTracker',
	#superclass : 'BytecodeInstructionClient',
	#instVars : [
		'executedMethods'
	],
	#category : 'PBA-BytecodeProfiler',
	#package : 'PBA',
	#tag : 'BytecodeProfiler'
}

{ #category : 'initialization' }
MethodsTracker >> initialize [

	super initialize.
	executedMethods := Dictionary new.
]

{ #category : 'instruction decoding' }
MethodsTracker >> send: selector super: supered numArgs: numberArguments [

	executedMethods at: selector update: [ :old | old + 1 ] initial: 1
]
