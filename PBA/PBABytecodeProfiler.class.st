Class {
	#name : 'PBABytecodeProfiler',
	#superclass : 'PBAAnalysisProfiler',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'testing' }
PBABytecodeProfiler >> analyze: aTargetProgram [

	^ PBAResult from: (BytecodeProfiler profile: (aTargetProgram asContext)) first
]
