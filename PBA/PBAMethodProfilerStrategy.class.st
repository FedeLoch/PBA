Class {
	#name : 'PBAMethodProfilerStrategy',
	#superclass : 'PBAAnalysisStrategy',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'testing' }
PBAMethodProfilerStrategy >> analyze: aTargetProgram [

	^ PBAResult from: (MethodProfiler profile: aTargetProgram)
]
