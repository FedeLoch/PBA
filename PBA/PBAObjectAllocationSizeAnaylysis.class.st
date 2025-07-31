Class {
	#name : 'PBAObjectAllocationSizeAnaylysis',
	#superclass : 'PBAIllimaniAnalysis',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'initialization' }
PBAObjectAllocationSizeAnaylysis >> defaultFeatureName [

	^ 'average object allocation size (B)'
]

{ #category : 'accessing' }
PBAObjectAllocationSizeAnaylysis >> valueToExtractFrom: profiler [

	^ profiler queryAllocationStats averageSizeInMemory asFloat round: 2
]
