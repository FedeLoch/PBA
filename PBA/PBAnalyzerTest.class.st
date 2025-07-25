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
PBAnalyzerTest >> testRunTheAnalyzerWithAbenchmarkItCountTheAverageObjectAllocationSize [

	| averageObjectAllocationSize |
	target := PBASmarkBenchmarkpProgram bench: SMarkDeltaBlue new.
	averageObjectAllocationSize := (analyzer analyze: target) at:
		                         'average object allocation size'.
		
	self assert: (averageObjectAllocationSize between: 45 and: 80)
]

{ #category : 'tests' }
PBAnalyzerTest >> testRunTheAnalyzerWithAbenchmarkItCountTheAverageObjectLifetime [

	| averageObjectLifetime |
	target := PBASmarkBenchmarkpProgram bench: SMarkDeltaBlue new.
	averageObjectLifetime := (analyzer analyze: target) at:
		                         'average object lifetime'.
		
	self assert: (averageObjectLifetime between: 29 and: 40)
]

{ #category : 'tests' }
PBAnalyzerTest >> testRunTheAnalyzerWithAbenchmarkItCountTheExecutionTime [

	| executionTime |
	target := PBASmarkBenchmarkpProgram bench: SMarkDeltaBlue new.
	executionTime := (analyzer analyze: target) at: 'executionTime'.

	self assert: (executionTime between: 30 and: 50)
]

{ #category : 'tests' }
PBAnalyzerTest >> testRunTheAnalyzerWithAbenchmarkItCountTheMemoryConsumed [

	| memoryConsumed |
	target := PBASmarkBenchmarkpProgram bench: SMarkDeltaBlue new.
	memoryConsumed := (analyzer analyze: target) at: 'memory consumed'.
	
	self assert: (memoryConsumed between: 55 and: 106)
]
