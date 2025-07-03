Class {
	#name : 'PBACallbacksAnaylysis',
	#superclass : 'PBAAnalysis',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'as yet unclassified' }
PBACallbacksAnaylysis >> endExecution: aTime for: result [

	self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
PBACallbacksAnaylysis >> startExecution: aTime [

	self subclassResponsibility 
]
