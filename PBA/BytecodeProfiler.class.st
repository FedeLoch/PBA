Class {
	#name : 'BytecodeProfiler',
	#superclass : 'Object',
	#instVars : [
		'currentContext',
		'featureTrackers'
	],
	#category : 'PBA-BytecodeProfiler',
	#package : 'PBA',
	#tag : 'BytecodeProfiler'
}

{ #category : 'accessing' }
BytecodeProfiler class >> profile: aContext [

	^ self new context: aContext; run
]

{ #category : 'accessing' }
BytecodeProfiler >> context [

	^ currentContext
]

{ #category : 'accessing' }
BytecodeProfiler >> context: aContext [

	currentContext := aContext
]

{ #category : 'running' }
BytecodeProfiler >> featureTrackers [

	^ featureTrackers 
]

{ #category : 'accessing' }
BytecodeProfiler >> initialize [

	super initialize.
	featureTrackers := BytecodeInstructionClient subclasses collect: [ :trackerClass |
		trackerClass new profiler: self
	].
]

{ #category : 'running' }
BytecodeProfiler >> notifyTrackers [

	featureTrackers do: [ :instClient |
			(InstructionStream on: currentContext method pc: currentContext pc)
				interpretNextInstructionFor: instClient
	]
]

{ #category : 'running' }
BytecodeProfiler >> result [

	"TODO"
	^ self
]

{ #category : 'running' }
BytecodeProfiler >> run [

	[ self notifyTrackers; context: currentContext step. currentContext willFailReturn ] whileFalse.

	^ self result
]
