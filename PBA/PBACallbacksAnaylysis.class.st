Class {
	#name : 'PBACallbacksAnaylysis',
	#superclass : 'PBAAnalysis',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'testing' }
PBACallbacksAnaylysis class >> isAbstract [

	^ self = PBACallbacksAnaylysis
]

{ #category : 'testing' }
PBACallbacksAnaylysis >> endExecution: aTime for: result [

	^ self putValueFrom: aTime in: result
]

{ #category : 'testing' }
PBACallbacksAnaylysis >> startExecution: aTime [

	self subclassResponsibility 
]
