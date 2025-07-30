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

{ #category : 'initialization' }
PBAExecutionTimeAnalysis >> defaultFeatureName [

	^ 'execution time (ms)'
]

{ #category : 'testing' }
PBAExecutionTimeAnalysis >> startExecution: aTime [

	initialTime := aTime
]

{ #category : 'accessing' }
PBAExecutionTimeAnalysis >> valueToExtractFrom: endTime [

	^ endTime - initialTime
]
