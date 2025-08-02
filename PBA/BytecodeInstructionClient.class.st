Class {
	#name : 'BytecodeInstructionClient',
	#superclass : 'InstructionClient',
	#instVars : [
		'profiler'
	],
	#category : 'PBA-BytecodeProfiler',
	#package : 'PBA',
	#tag : 'BytecodeProfiler'
}

{ #category : 'as yet unclassified' }
BytecodeInstructionClient >> dumpResult: aResult [

	^ aResult	
]

{ #category : 'accessing' }
BytecodeInstructionClient >> profiler: aProfiler [

	profiler := aProfiler 
]
