Class {
	#name : 'CallSitesTracker',
	#superclass : 'BytecodeInstructionClient',
	#instVars : [
		'callSites'
	],
	#category : 'PBA-BytecodeProfiler',
	#package : 'PBA',
	#tag : 'BytecodeProfiler'
}

{ #category : 'as yet unclassified' }
CallSitesTracker >> differentCallSites [

	^ callSites keys size
]

{ #category : 'as yet unclassified' }
CallSitesTracker >> dumpResult: aResult [

	aResult at: 'differentCallSites' put: self differentCallSites
]

{ #category : 'initialization' }
CallSitesTracker >> initialize [

	super initialize.
	callSites := Dictionary new.
]

{ #category : 'instruction decoding' }
CallSitesTracker >> send: selector super: supered numArgs: numberArguments [

	| sender |
	
	sender := profiler context sender.
	
	sender ifNotNil: [
		callSites at: sender asString update: [ :old | old + 1 ] initial: 1
	]. 
]
