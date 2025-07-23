Class {
	#name : 'PBAObjectAllocationSizeAnaylysis',
	#superclass : 'PBAIllimaniAnaylysis',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'as yet unclassified' }
PBAObjectAllocationSizeAnaylysis >> queryOn: profiler for: result [

	| allocations |
	allocations := profiler objectAllocations.
	^ result
		  at: 'average object allocation size'
		  put:
		  ((allocations collect: #sizeInBytes) average asFloat round: 2)
]
