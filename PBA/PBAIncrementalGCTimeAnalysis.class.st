Class {
	#name : 'PBAIncrementalGCTimeAnalysis',
	#superclass : 'PBAGarbageCollectionAnalysis',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'initialization' }
PBAIncrementalGCTimeAnalysis >> defaultFeatureName [

	^ 'totalIncrementalGCTime'
]

{ #category : 'accessing' }
PBAIncrementalGCTimeAnalysis >> gcTime [

	^ Smalltalk vm totalIncrementalGCTime
]
