Class {
	#name : 'PBAExecutionTimeAnalysis',
	#superclass : 'PBACallbacksAnalysis',
	#instVars : [
		'initialTime'
	],
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'accessing' }
PBAExecutionTimeAnalysis class >> key [

	^ 'executionTime'

	

	
]

{ #category : 'initialization' }
PBAExecutionTimeAnalysis >> defaultFeatureName [

	^ self class key
]

{ #category : 'testing' }
PBAExecutionTimeAnalysis >> startExecution: aTime [

	initialTime := aTime
]

{ #category : 'accessing' }
PBAExecutionTimeAnalysis >> valueToExtractFrom: endTime [

	^ endTime - initialTime
]
