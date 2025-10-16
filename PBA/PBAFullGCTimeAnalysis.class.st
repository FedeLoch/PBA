Class {
	#name : 'PBAFullGCTimeAnalysis',
	#superclass : 'PBAGarbageCollectionAnalysis',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'initialization' }
PBAFullGCTimeAnalysis >> defaultFeatureName [ 

	^ 'totalFullGCTime'
]

{ #category : 'accessing' }
PBAFullGCTimeAnalysis >> gcTime [

	^ Smalltalk vm totalFullGCTime
]
