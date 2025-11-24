Class {
	#name : 'PBABytecodeProfiler',
	#superclass : 'PBAAnalysisProfiler',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'as yet unclassified' }
PBABytecodeProfiler class >> bytecodesKey [

	^ 'bytecodes'

]

{ #category : 'testing' }
PBABytecodeProfiler >> analyze: aTargetProgram [

	^ PBAResult from: ({
		self class bytecodesKey 	-> (BytecodeProfiler profile: (aTargetProgram asContext)) first
	}) asDictionary
]
