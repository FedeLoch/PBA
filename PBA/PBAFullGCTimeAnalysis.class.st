Class {
	#name : 'PBAFullGCTimeAnalysis',
	#superclass : 'PBACallbacksAnalysis',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'accessing' }
PBAFullGCTimeAnalysis class >> key [

	^ 'totalFullGCTime'
]

{ #category : 'accessing' }
PBAFullGCTimeAnalysis >> time [

	^ Smalltalk vm totalFullGCTime
]
