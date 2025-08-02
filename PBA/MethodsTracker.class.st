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

{ #category : 'as yet unclassified' }
MethodsTracker >> differentMethodsCalled [

	^ executedMethods keys size
]

{ #category : 'as yet unclassified' }
MethodsTracker >> dumpResult: aResult [

	aResult at: 'totalMethodsCalled' put: self totalMethodsCalled.
	aResult at: 'differentMethodsCalled' put: self differentMethodsCalled
]

{ #category : 'initialization' }
MethodsTracker >> initialize [

	super initialize.
	executedMethods := Dictionary new.
]

{ #category : 'instruction decoding' }
MethodsTracker >> send: selector super: supered numArgs: numberArguments [

	executedMethods at: selector update: [ :old | old + 1 ] initial: 1
]

{ #category : 'accessing' }
MethodsTracker >> totalMethodsCalled [

	^ executedMethods values sum
]
