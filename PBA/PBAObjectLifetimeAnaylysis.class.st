Class {
	#name : 'PBAObjectLifetimeAnaylysis',
	#superclass : 'PBAIllimaniAnaylysis',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'as yet unclassified' }
PBAObjectLifetimeAnaylysis >> queryOn: profiler for: result [

	^ result
		  at: 'average object lifetime (%)'
		  put:
			  (profiler queryAllocationStats averageRelativeLifetime asFloat
			   * 100 round: 2)
]
