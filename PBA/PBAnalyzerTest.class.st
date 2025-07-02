Class {
	#name : 'PBAnalyzerTest',
	#superclass : 'TestCase',
	#instVars : [
		'target',
		'analyzer'
	],
	#category : 'PBA-Analyzer',
	#package : 'PBA',
	#tag : 'Analyzer'
}

{ #category : 'tests' }
PBAnalyzerTest >> setUp [ 

	self setUp.
	analyzer := PBAnalyzer new.
]

{ #category : 'tests' }
PBAnalyzerTest >> testRunTheAnalyzerWithAbenchmarkItCountTheExecutionTime [

	target := PBASmarkBenchmarkpProgram bench: SMarkDeltaBlue new.
	analyzer analysis: { PBAExecutionTimeAnalysis new }.
	
	self assert: (analyzer analyze: target) executionTime equals: 400 milliSeconds.
]
