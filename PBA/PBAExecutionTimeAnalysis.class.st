Class {
	#name : 'PBAExecutionTimeAnalysis',
	#superclass : 'PBACallbacksAnalysis',
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

{ #category : 'accessing' }
PBAExecutionTimeAnalysis >> time [

	^ Time microsecondClockValue
]
