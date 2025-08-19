Class {
	#name : 'PBACoverageCollectorStrategy',
	#superclass : 'PBAAnalysisStrategy',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'testing' }
PBACoverageCollectorStrategy >> analyze: aTargetProgram [

	| result|
	
	result := CoverageCollector new methods: aTargetProgram methodsToExecute; runOn: [ aTargetProgram run ].

	^ PBAResult new at: 'coveredMethods' put: result methods size;
		at: 'coveredNodes' put: result nodes size
]
