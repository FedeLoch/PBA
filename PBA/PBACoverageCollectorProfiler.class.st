Class {
	#name : 'PBACoverageCollectorProfiler',
	#superclass : 'PBAAnalysisProfiler',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'testing' }
PBACoverageCollectorProfiler >> analyze: aTargetProgram [

	| result|
	
	result := CoverageCollector new methods: aTargetProgram methodsToExecute; runOn: [ aTargetProgram run ].

	^ PBAResult from: ({
		'methodsCovered' -> result methods size.
		'percentageCovered' -> result percentage.
		'coveredNodes' -> result nodes size
	} asDictionary)
]
