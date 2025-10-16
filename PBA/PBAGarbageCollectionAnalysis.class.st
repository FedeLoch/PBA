Class {
	#name : 'PBAGarbageCollectionAnalysis',
	#superclass : 'PBAAnalysis',
	#instVars : [
		'initialGCTime'
	],
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'as yet unclassified' }
PBAGarbageCollectionAnalysis >> endExecutionFor: result [

	self putValueFrom: self gcTime in: result.
	^ result
]

{ #category : 'accessing' }
PBAGarbageCollectionAnalysis >> gcTime [

	^ self subclassResponsibility
]

{ #category : 'testing' }
PBAGarbageCollectionAnalysis >> startExecution [

	initialGCTime := self gcTime
]

{ #category : 'accessing' }
PBAGarbageCollectionAnalysis >> valueToExtractFrom: aGCTime [

	^ aGCTime - initialGCTime
]
