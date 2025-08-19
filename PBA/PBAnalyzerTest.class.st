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
	self timeLimit: 5 hours.

	analyzer := PBAnalyzer new.

	deltaBlue := PBASmarkBenchmarkProgram bench: SMarkDeltaBlue new.
	deltaBlue classesToExecute: 'SMark-DeltaBlue' asPackage classes.
]

{ #category : 'tests' }
PBAnalyzerTest >> testRunTheAnalyzerWithAbenchmarkItCountTheAverageObjectAllocationSize [

	| averageObjectAllocationSize result |
	
	result := analyzer analyze: deltaBlue.
	averageObjectAllocationSize := result at: 'average object allocation size (B)'.
	
	self assert: (averageObjectAllocationSize between: 1 and: 100)
]

{ #category : 'tests' }
PBAnalyzerTest >> testRunTheAnalyzerWithAbenchmarkItCountTheAverageObjectLifetime [

	| averageObjectLifetime result |
	
	result := analyzer analyze: deltaBlue.
	averageObjectLifetime := result at: 'average object lifetime (%)'.
		
	self assert: (averageObjectLifetime between: 1 and: 100)
]

{ #category : 'tests' }
PBAnalyzerTest >> testRunTheAnalyzerWithAbenchmarkItCountTheAverageOfArguments [

	| total result |
	
	result := analyzer analyze: deltaBlue.
	total := result at: 'avgArguments'.
	
	self assert: total equals: 0.714
]

{ #category : 'tests' }
PBAnalyzerTest >> testRunTheAnalyzerWithAbenchmarkItCountTheExecutionTime [

	| executionTime result |
	
	result := analyzer analyze: deltaBlue.
	executionTime := result at: 'execution time (μs)'.

	self assert: (executionTime between: 1 and: 100000)

]

{ #category : 'tests' }
PBAnalyzerTest >> testRunTheAnalyzerWithAbenchmarkItCountTheMemoryConsumed [

	| memoryConsumed result |
	
	result := analyzer analyze: deltaBlue.
	memoryConsumed := result at: 'memory consumed (B)'.
	
	self assert: (memoryConsumed between: 50000 and: 150000)
]

{ #category : 'tests' }
PBAnalyzerTest >> testRunTheAnalyzerWithAbenchmarkItCountTheTotalNumberOfCoveredMethods [

	| total result |
	
	result := analyzer analyze: deltaBlue.
	total := result at: 'coveredMethods'.

	self assert: total equals: 6
]

{ #category : 'tests' }
PBAnalyzerTest >> testRunTheAnalyzerWithAbenchmarkItCountTheTotalNumberOfCoveredNodes [

	| total result |
	
	result := analyzer analyze: deltaBlue.
	total := result at: 'coveredNodes'.

	self assert: total equals: 7
]

{ #category : 'tests' }
PBAnalyzerTest >> testRunTheAnalyzerWithAbenchmarkItCountTheTotalNumberOfDifferentCallSites [

	| total result |
	
	result := analyzer analyze: deltaBlue.
	total := result at: 'differentCallSites'.
	
	self assert: total equals: 489
]

{ #category : 'tests' }
PBAnalyzerTest >> testRunTheAnalyzerWithAbenchmarkItCountTheTotalNumberOfDifferentExecutedBlocks [

	| total result |
	
	result := analyzer analyze: deltaBlue.
	total := result at: 'differentExecutedBlocks'.

	self assert: total equals: 16
]

{ #category : 'tests' }
PBAnalyzerTest >> testRunTheAnalyzerWithAbenchmarkItCountTheTotalNumberOfDifferentExecutedBytecodes [

	| total result |
	
	result := analyzer analyze: deltaBlue.
	total := result at: 'differentExecutedBytecodes'.
	
	self assert: total equals: 356
]

{ #category : 'tests' }
PBAnalyzerTest >> testRunTheAnalyzerWithAbenchmarkItCountTheTotalNumberOfDifferentMethodsCalled [

	| total result |
	
	result := analyzer analyze: deltaBlue.
	total := result at: 'differentMethodsCalled'.
	
	self assert: total equals: 179
]

{ #category : 'tests' }
PBAnalyzerTest >> testRunTheAnalyzerWithAbenchmarkItCountTheTotalNumberOfExecutedBlocks [

	| total result |
	
	result := analyzer analyze: deltaBlue.
	total := result at: 'totalExecutedBlocks'.

	self assert: total equals: 840279
]

{ #category : 'tests' }
PBAnalyzerTest >> testRunTheAnalyzerWithAbenchmarkItCountTheTotalNumberOfExecutedBytecodes [

	| total result |
	
	result := analyzer analyze: deltaBlue.
	total := result at: 'totalExecutedBytecodes'.

	self assert: total equals: 50833582
]

{ #category : 'tests' }
PBAnalyzerTest >> testRunTheAnalyzerWithAbenchmarkItCountTheTotalNumberOfExecutedLoops [

	| total result |
	
	result := analyzer analyze: deltaBlue.
	total := result at: 'totalExecutedLoops'.

	self assert: total equals: 895444
]

{ #category : 'tests' }
PBAnalyzerTest >> testRunTheAnalyzerWithAbenchmarkItCountTheTotalNumberOfMethodsCalled [

	| total result |
	
	result := analyzer analyze: deltaBlue.
	total := result at: 'totalMethodsCalled'.

	self assert: total equals: 12267491
]
