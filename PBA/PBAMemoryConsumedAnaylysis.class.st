Class {
	#name : 'PBAMemoryConsumedAnaylysis',
	#superclass : 'PBAIllimaniAnalysis',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'initialization' }
PBAMemoryConsumedAnaylysis >> defaultFeatureName [

	^ 'memory consumed (B)'
]

{ #category : 'accessing' }
PBAMemoryConsumedAnaylysis >> valueToExtractFrom: profiler [

	^ profiler queryAllocationStats totalAllocatedMemory
]
