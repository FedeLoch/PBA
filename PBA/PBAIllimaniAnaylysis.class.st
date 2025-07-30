Class {
	#name : 'PBAIllimaniAnaylysis',
	#superclass : 'PBAAnalysis',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'testing' }
PBAIllimaniAnaylysis class >> isAbstract [

	^ self = PBAIllimaniAnaylysis
]

{ #category : 'accessing' }
PBAIllimaniAnaylysis >> queryOn: profiler for: result [

	^ self putValueFrom: profiler in: result
]
