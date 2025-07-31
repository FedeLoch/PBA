Class {
	#name : 'PBACallbacksAnalysis',
	#superclass : 'PBAAnalysis',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'testing' }
PBACallbacksAnalysis class >> isAbstract [

	^ self = PBACallbacksAnalysis
]

{ #category : 'testing' }
PBACallbacksAnalysis >> endExecution: aTime for: result [

	^ self putValueFrom: aTime in: result
]

{ #category : 'testing' }
PBACallbacksAnalysis >> startExecution: aTime [

	self subclassResponsibility 
]
