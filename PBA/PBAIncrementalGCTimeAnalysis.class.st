Class {
	#name : 'PBAIncrementalGCTimeAnalysis',
	#superclass : 'PBACallbacksAnalysis',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'initialization' }
PBAIncrementalGCTimeAnalysis >> defaultFeatureName [

	^ 'totalIncrementalGCTime'
]

{ #category : 'accessing' }
PBAIncrementalGCTimeAnalysis >> time [

	^ Smalltalk vm totalIncrementalGCTime
]
