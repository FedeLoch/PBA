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

{ #category : 'accessing' }
PBAExecutionTimeAnalysis >> time [

	^ Time microsecondClockValue
]
