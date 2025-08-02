Class {
	#name : 'PBABytecodeProfilerStrategy',
	#superclass : 'PBAAnalysisStrategy',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'testing' }
PBABytecodeProfilerStrategy >> analyze: aTargetProgram [

	| profiler |
	
	profiler := BytecodeProfiler profile: (aTargetProgram asContext).

	^ profiler featureTrackers inject: PBAResult new into: [ :result :tracker |
		tracker dumpResult: result.
		result
	]
]
