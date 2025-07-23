Class {
	#name : 'PBAIllimaniStrategy',
	#superclass : 'PBAAnalysisStrategy',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'testing' }
PBAIllimaniStrategy >> analyze: aTargetProgram [

	| profiler |
	profiler := IllMemoryProfiler new profileOn: [ aTargetProgram run ].
	^ analysis
		  inject: PBAResult new
		  into: [ :result :anAnalysis |
		  anAnalysis queryOn: profiler for: result ]
]

{ #category : 'initialization' }
PBAIllimaniStrategy >> initialize [

	super initialize.
	analysis := {
		            PBAObjectLifetimeAnaylysis new.
		            PBAMemoryConsumedAnaylysis new }
]
