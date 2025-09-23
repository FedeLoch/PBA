Class {
	#name : 'PBACoverageCollectorProfiler',
	#superclass : 'PBAAnalysisProfiler',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'as yet unclassified' }
PBACoverageCollectorProfiler class >> coverageKey [

	^ 'coverage'
]

{ #category : 'testing' }
PBACoverageCollectorProfiler >> analyze: aTargetProgram [

	| result|
	
	result := CoverageCollector new methods: aTargetProgram methodsToExecute; runOn: [ aTargetProgram run ].

	^ PBAResult from: ({
		self class coverageKey -> {
			'methodsCovered' -> result methods size.
			'percentageCovered' -> result percentage.
			'coveredNodes' -> result nodes size
		} asDictionary
	} asDictionary)
]
