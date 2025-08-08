Class {
	#name : 'PBABytecodeProfilerStrategy',
	#superclass : 'PBAAnalysisStrategy',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'testing' }
PBABytecodeProfilerStrategy >> analyze: aTargetProgram [

	^ PBAResult from: (BytecodeProfiler profile: (aTargetProgram asContext)) first
]
