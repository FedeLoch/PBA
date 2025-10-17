Class {
	#name : 'PBAFullGCTimeAnalysis',
	#superclass : 'PBACallbacksAnalysis',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'initialization' }
PBAFullGCTimeAnalysis >> defaultFeatureName [ 

	^ 'totalFullGCTime'
]

{ #category : 'accessing' }
PBAFullGCTimeAnalysis >> time [

	^ Smalltalk vm totalFullGCTime
]
