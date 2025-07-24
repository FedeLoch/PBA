Class {
	#name : 'PBAMemoryConsumedAnaylysis',
	#superclass : 'PBAIllimaniAnaylysis',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'as yet unclassified' }
PBAMemoryConsumedAnaylysis >> queryOn: profiler for: result [

	^ result
		  at: 'memory consumed (KB)'
		  put: profiler queryAllocationStats totalAllocatedMemory
				  humanReadableByteSizeString asInteger
]
