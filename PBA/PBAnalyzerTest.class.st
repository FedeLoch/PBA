Class {
	#name : 'PBAnalyzerTest',
	#superclass : 'TestCase',
	#instVars : [
		'target',
		'analyzer',
		'deltaBlue'
	],
	#category : 'PBA-Analyzer',
	#package : 'PBA',
	#tag : 'Analyzer'
}

{ #category : 'tests' }
PBAnalyzerTest >> setUp [ 

	super setUp.
	analyzer := PBAnalyzer new.
	deltaBlue := PBASmarkBenchmarkpProgram bench: SMarkDeltaBlue new.
]

{ #category : 'tests' }
PBAnalyzerTest >> testRunTheAnalyzerWithAbenchmarkItCountTheAverageObjectAllocationSize [

	| averageObjectAllocationSize |
	averageObjectAllocationSize := (analyzer analyze: deltaBlue) at:
		                         'average object allocation size (B)'.
		
	self assert: (averageObjectAllocationSize between: 45 and: 80)
]

{ #category : 'tests' }
PBAnalyzerTest >> testRunTheAnalyzerWithAbenchmarkItCountTheAverageObjectLifetime [

	| averageObjectLifetime |
	averageObjectLifetime := (analyzer analyze: deltaBlue) at:
		                         'average object lifetime (%)'.
		
	self assert: (averageObjectLifetime between: 29 and: 40)
]

{ #category : 'tests' }
PBAnalyzerTest >> testRunTheAnalyzerWithAbenchmarkItCountTheExecutionTime [

	| executionTime |
	executionTime := (analyzer analyze: deltaBlue) at: 'execution time (ms)'.

	self assert: (executionTime between: 30 and: 50)

]

{ #category : 'tests' }
PBAnalyzerTest >> testRunTheAnalyzerWithAbenchmarkItCountTheMemoryConsumed [

	| memoryConsumed |
	memoryConsumed := (analyzer analyze: deltaBlue) at: 'memory consumed (B)'.
	
	self assert: (memoryConsumed between: 53000 and: 107000)
]
