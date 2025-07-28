Class {
	#name : 'PBAMemoryConsumedAnaylysis',
	#superclass : 'PBAIllimaniAnaylysis',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'accessing - query' }
PBAMemoryConsumedAnaylysis >> queryOn: profiler for: result [

	^ result
		  at: 'memory consumed (B)'
		  put: profiler queryAllocationStats totalAllocatedMemory
]
