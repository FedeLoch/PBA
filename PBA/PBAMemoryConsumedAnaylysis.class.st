Class {
	#name : 'PBAMemoryConsumedAnaylysis',
	#superclass : 'PBAIllimaniAnaylysis',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'as yet unclassified' }
PBAMemoryConsumedAnaylysis >> queryOn: profiler for: result [

	| stats |
	stats := profiler queryAllocationStats.
	^ result
		  at: 'memory consumed'
		  put:
		  stats totalAllocatedMemory humanReadableByteSizeString asInteger
]
