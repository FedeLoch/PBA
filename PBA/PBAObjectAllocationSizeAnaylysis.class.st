Class {
	#name : 'PBAObjectAllocationSizeAnaylysis',
	#superclass : 'PBAIllimaniAnaylysis',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'as yet unclassified' }
PBAObjectAllocationSizeAnaylysis >> queryOn: profiler for: result [

	^ result
		  at: 'average object allocation size (B)'
		  put:
		  (profiler queryAllocationStats averageSizeInMemory asFloat round:
			   2)
]
