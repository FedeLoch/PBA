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

	super setUp.
	analyzer := PBAnalyzer new.
]

{ #category : 'tests' }
PBAnalyzerTest >> testRunTheAnalyzerWithAbenchmarkItCountTheAverageObjectLifetime [

	| averageObjectLifetime |
	target := PBASmarkBenchmarkpProgram bench: SMarkDeltaBlue new.
	averageObjectLifetime := (analyzer analyze: target) at:
		                         'average object lifetime'.
	self assert: (averageObjectLifetime between: 29 and: 38)
]

{ #category : 'tests' }
PBAnalyzerTest >> testRunTheAnalyzerWithAbenchmarkItCountTheCPUUsed [

	target := PBASmarkBenchmarkpProgram bench: SMarkDeltaBlue new.
	
	self assert: ((analyzer analyze: target) at: 'cpu') equals: 400
]

{ #category : 'tests' }
PBAnalyzerTest >> testRunTheAnalyzerWithAbenchmarkItCountTheExecutionTime [

	target := PBASmarkBenchmarkpProgram bench: SMarkDeltaBlue new.
	
	self assert: ((analyzer analyze: target) at: 'executionTime') equals: 50
]

{ #category : 'tests' }
PBAnalyzerTest >> testRunTheAnalyzerWithAbenchmarkItCountTheMemoryUsed [

	target := PBASmarkBenchmarkpProgram bench: SMarkDeltaBlue new.
	
	self assert: ((analyzer analyze: target) at: 'memory') equals: 400
]
