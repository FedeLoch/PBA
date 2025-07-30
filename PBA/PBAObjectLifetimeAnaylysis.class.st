Class {
	#name : 'PBAObjectLifetimeAnaylysis',
	#superclass : 'PBAIllimaniAnaylysis',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'initialization' }
PBAObjectLifetimeAnaylysis >> defaultFeatureName [

	^ 'average object lifetime (%)'
]

{ #category : 'accessing' }
PBAObjectLifetimeAnaylysis >> valueToExtractFrom: profiler [

	^ profiler queryAllocationStats averageRelativeLifetime asFloat * 100
		  round: 2
]
