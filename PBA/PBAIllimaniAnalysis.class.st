Class {
	#name : 'PBAIllimaniAnalysis',
	#superclass : 'PBAAnalysis',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'testing' }
PBAIllimaniAnalysis class >> isAbstract [

	^ self = PBAIllimaniAnalysis
]

{ #category : 'accessing' }
PBAIllimaniAnalysis >> queryOn: profiler for: result [

	^ self putValueFrom: profiler in: result
]
