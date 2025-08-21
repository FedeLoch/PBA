Class {
	#name : 'PBAPBTBenchmarkProgram',
	#superclass : 'PBABenchmarkTarget',
	#instVars : [
		'test'
	],
	#category : 'PBA-Target',
	#package : 'PBA',
	#tag : 'Target'
}

{ #category : 'tests' }
PBAPBTBenchmarkProgram class >> test: test [

	^ self new test: test
]

{ #category : 'as yet unclassified' }
PBAPBTBenchmarkProgram >> classesToExecute [

	^ { test receiver class }
]

{ #category : 'converting' }
PBAPBTBenchmarkProgram >> name [ 

	^ test name asString 
]

{ #category : 'converting' }
PBAPBTBenchmarkProgram >> run [

	^ test run
]

{ #category : 'accessing' }
PBAPBTBenchmarkProgram >> test: aTest [
	aTest resetAutotune.
	aTest autoTuneIterationsFor: 300 milliSeconds.
	test := aTest 

	
]
