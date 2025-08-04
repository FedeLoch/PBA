Class {
	#name : 'MethodsTracker',
	#superclass : 'BytecodeInstructionClient',
	#instVars : [
		'executedMethods',
		'totalArguments'
	],
	#category : 'PBA-BytecodeProfiler',
	#package : 'PBA',
	#tag : 'BytecodeProfiler'
}

{ #category : 'accessing' }
MethodsTracker >> avgArguments [

	^  (totalArguments / self totalMethodsCalled) asFloat round: 3
]

{ #category : 'as yet unclassified' }
MethodsTracker >> differentMethodsCalled [

	^ executedMethods keys size
]

{ #category : 'as yet unclassified' }
MethodsTracker >> dumpResult: aResult [

	aResult at: 'totalMethodsCalled' put: self totalMethodsCalled.
	aResult at: 'differentMethodsCalled' put: self differentMethodsCalled.
	aResult at: 'avgArguments' put: self avgArguments.
]

{ #category : 'initialization' }
MethodsTracker >> initialize [

	super initialize.
	totalArguments := 0.
	executedMethods := Dictionary new.
]

{ #category : 'instruction decoding' }
MethodsTracker >> send: selector super: supered numArgs: numberArguments [

	executedMethods at: profiler context method update: [ :old | old + 1 ] initial: 1.
	totalArguments := totalArguments + numberArguments
]

{ #category : 'accessing' }
MethodsTracker >> totalMethodsCalled [

	^ executedMethods values sum
]
