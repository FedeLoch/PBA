Class {
	#name : 'PBACallBacksStrategy',
	#superclass : 'PBAAnalysisStrategy',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'accessing' }
PBACallBacksStrategy >> analysisClass [

	^ PBACallbacksAnalysis
]

{ #category : 'testing' }
PBACallBacksStrategy >> analyze: aTargetProgram [

	| startTime endTime |
	
	startTime := Time now asMilliSeconds.
	analysis do: [ :anAnalysis | anAnalysis startExecution: startTime ].
	
	aTargetProgram run.
	
	endTime := Time now asMilliSeconds.
	^ analysis inject: PBAResult new into: [ :result :anAnalysis |
		anAnalysis endExecution: endTime for: result
	].
]
