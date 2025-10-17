Class {
	#name : 'PBACallBacksProfiler',
	#superclass : 'PBAAnalysisProfiler',
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'testing' }
PBACallBacksProfiler >> analyze: aTargetProgram [

	analysis do: [ :anAnalysis | anAnalysis startExecution ].

	aTargetProgram run.

	^ analysis
		  inject: PBAResult new
		  into: [ :result :anAnalysis | anAnalysis endExecutionFor: result ]
]

{ #category : 'initialization' }
PBACallBacksProfiler >> initialize [

	super initialize.
	analysis := {
		            PBAExecutionTimeAnalysis new.
		            PBAIncrementalGCTimeAnalysis new.
		            PBAFullGCTimeAnalysis new }
]

{ #category : 'accessing' }
PBACallBacksProfiler >> measuringOnlyExecutionTime [

	analysis := { PBAExecutionTimeAnalysis new }
]
