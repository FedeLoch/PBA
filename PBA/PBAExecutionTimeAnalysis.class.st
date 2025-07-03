Class {
	#name : 'PBAExecutionTimeAnalysis',
	#superclass : 'PBACallbacksAnaylysis',
	#instVars : [
		'initialTime'
	],
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'testing' }
PBAExecutionTimeAnalysis >> endExecution: aTime for: result [

	^ result at: 'execution' put: { 'time' -> (Time now asMilliSeconds - initialTime) }
]

{ #category : 'testing' }
PBAExecutionTimeAnalysis >> startExecution: aTime [

	initialTime := aTime
]
