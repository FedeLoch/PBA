Class {
	#name : 'PBAIllimaniProfiler',
	#superclass : 'PBAAnalysisProfiler',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'as yet unclassified' }
PBAIllimaniProfiler class >> memoryKey [

	^ 'memory'
]

{ #category : 'testing' }
PBAIllimaniProfiler >> analysisResults: profiler [
	
	^ analysis inject: Dictionary new into: [ :result :anAnalysis |
		anAnalysis queryOn: profiler for: result.
		result
	]
]

{ #category : 'testing' }
PBAIllimaniProfiler >> analyze: aTargetProgram [

	| profiler |
	profiler := FiLiP new profileOn: [ aTargetProgram run ].
	
	^ PBAResult from: ({ self class memoryKey -> (self analysisResults: profiler) } asDictionary)
]

{ #category : 'initialization' }
PBAIllimaniProfiler >> initialize [

	super initialize.
	analysis := PBAIllimaniAnalysis allSubclasses collect: #new
]
