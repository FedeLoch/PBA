Class {
	#name : 'PBAExecutionTimeAnalysis',
	#superclass : 'PBAAnalysis',
	#category : 'PBA-Analysis',
	#package : 'PBA',
	#tag : 'Analysis'
}

{ #category : 'testing' }
PBAExecutionTimeAnalysis >> analyze: aTargetProgram [

	| result startTime |
	
	result := PBAResult new.
	startTime := Time now asMilliSeconds.
	
	aTargetProgram run.
	
	^ result at: 'executionTime' put: (Time now asMilliSeconds - startTime)
]
