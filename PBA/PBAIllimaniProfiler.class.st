Class {
	#name : 'PBAIllimaniProfiler',
	#superclass : 'PBAAnalysisProfiler',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'testing' }
PBAIllimaniProfiler >> analyze: aTargetProgram [

	| profiler |
	profiler := FiLiP new profileOn: [ aTargetProgram run ].
	^ analysis
		  inject: PBAResult new
		  into: [ :result :anAnalysis |
		  anAnalysis queryOn: profiler for: result ]
]

{ #category : 'initialization' }
PBAIllimaniProfiler >> initialize [

	super initialize.
	analysis := PBAIllimaniAnalysis allSubclasses collect: #new
]
