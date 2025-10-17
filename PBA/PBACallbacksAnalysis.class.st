Class {
	#name : 'PBACallbacksAnalysis',
	#superclass : 'PBAAnalysis',
	#instVars : [
		'initialTime'
	],
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'testing' }
PBACallbacksAnalysis class >> isAbstract [

	^ self = PBACallbacksAnalysis
]

{ #category : 'initialization' }
PBACallbacksAnalysis >> defaultFeatureName [ 

	^ self class key
]

{ #category : 'testing' }
PBACallbacksAnalysis >> endExecutionFor: result [

	self putValueFrom: self time in: result.
	^ result
]

{ #category : 'testing' }
PBACallbacksAnalysis >> startExecution [

	initialTime := self time
]

{ #category : 'accessing' }
PBACallbacksAnalysis >> time [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
PBACallbacksAnalysis >> valueToExtractFrom: aTime [

	^ aTime - initialTime
]
