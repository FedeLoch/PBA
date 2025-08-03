Class {
	#name : 'BlocksTracker',
	#superclass : 'BytecodeInstructionClient',
	#instVars : [
		'executedBlocks'
	],
	#category : 'PBA-BytecodeProfiler',
	#package : 'PBA',
	#tag : 'BytecodeProfiler'
}

{ #category : 'instruction decoding' }
BlocksTracker >> blockReturnTop [

	executedBlocks at: (profiler context method hash) update: [ :old | old + 1 ] initial: 1.
]

{ #category : 'as yet unclassified' }
BlocksTracker >> differentExecutedBlocks [

	^ executedBlocks keys size
]

{ #category : 'as yet unclassified' }
BlocksTracker >> dumpResult: aResult [

	aResult at: 'totalExecutedBlocks' put: self totalExecutedBlocks.
	aResult at: 'differentExecutedBlocks' put: self differentExecutedBlocks
]

{ #category : 'initialization' }
BlocksTracker >> initialize [

	super initialize.
	executedBlocks := Dictionary new.
]

{ #category : 'as yet unclassified' }
BlocksTracker >> totalExecutedBlocks [

	^ executedBlocks values sum
]
