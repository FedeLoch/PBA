Class {
	#name : 'PBAObjectLifetimeAnaylysis',
	#superclass : 'PBAIllimaniAnaylysis',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'as yet unclassified' }
PBAObjectLifetimeAnaylysis >> queryOn: profiler for: result [

	| stats lifetimes |
	stats := profiler queryAllocationStats.
	lifetimes := stats objectAllocations collect: [ :obj |
		             obj lifetime / profiler totalTime asFloat * 100 ].
	^ result
		  at: 'average object lifetime'
		  put: (lifetimes average round: 2)
]
