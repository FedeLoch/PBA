Class {
	#name : 'PBAIncrementalGCTimeAnalysis',
	#superclass : 'PBACallbacksAnalysis',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'accessing' }
PBAIncrementalGCTimeAnalysis class >> key [

	^ 'totalIncrementalGCTime'
]

{ #category : 'accessing' }
PBAIncrementalGCTimeAnalysis >> time [

	^ Smalltalk vm totalIncrementalGCTime
]
