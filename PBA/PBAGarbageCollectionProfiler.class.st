Class {
	#name : 'PBAGarbageCollectionProfiler',
	#superclass : 'PBAAnalysisProfiler',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'testing' }
PBAGarbageCollectionProfiler >> analyze: aTargetProgram [

	analysis do: [ :anAnalysis | anAnalysis startExecution ].

	aTargetProgram run.

	^ analysis
		  inject: PBAResult new
		  into: [ :result :anAnalysis | anAnalysis endExecutionFor: result ]
]

{ #category : 'initialization' }
PBAGarbageCollectionProfiler >> initialize [

	super initialize.
	analysis := PBAGarbageCollectionAnalysis allSubclasses collect: #new
]
