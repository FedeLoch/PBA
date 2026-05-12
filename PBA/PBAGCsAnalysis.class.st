Class {
	#name : 'PBAGCsAnalysis',
	#superclass : 'PBAAnalysis',
	#instVars : [
		'initialGCs'
	],
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'initialization' }
PBAGCsAnalysis >> defaultFeatureName [

	^ 'gcs'
]

{ #category : 'testing' }
PBAGCsAnalysis >> endExecutionFor: result [

	self putValueFrom: self gcs in: result.
	
	^ result
]

{ #category : 'testing' }
PBAGCsAnalysis >> gcs [

	^ Smalltalk vm fullGCCount
]

{ #category : 'testing' }
PBAGCsAnalysis >> startExecution [

	initialGCs := self gcs
]
