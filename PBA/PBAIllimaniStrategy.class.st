Class {
	#name : 'PBAIllimaniStrategy',
	#superclass : 'PBAAnalysisStrategy',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'accessing' }
PBAIllimaniStrategy >> analysisClass [

	^ PBAIllimaniAnalysis
]

{ #category : 'testing' }
PBAIllimaniStrategy >> analyze: aTargetProgram [

	| profiler |
	profiler := IllMemoryProfiler new profileOn: [ aTargetProgram run ].
	^ analysis
		  inject: PBAResult new
		  into: [ :result :anAnalysis |
		  anAnalysis queryOn: profiler for: result ]
]
