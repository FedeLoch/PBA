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
PBAExecutionTimeAnalysis >> endExecution: endTime for: result [

	^ result at: 'executionTime' put: (endTime - initialTime)
]

{ #category : 'testing' }
PBAExecutionTimeAnalysis >> startExecution: aTime [

	initialTime := aTime
]
