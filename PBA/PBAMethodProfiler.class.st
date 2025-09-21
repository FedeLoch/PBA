Class {
	#name : 'PBAMethodProfiler',
	#superclass : 'PBAAnalysisProfiler',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'testing' }
PBAMethodProfiler >> analyze: aTargetProgram [

	^ PBAResult from: (MethodProfiler profile: aTargetProgram)
]
