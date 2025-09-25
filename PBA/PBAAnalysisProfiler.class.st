Class {
	#name : 'PBAAnalysisProfiler',
	#superclass : 'Object',
	#instVars : [
		'analysis'
	],
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'testing' }
PBAAnalysisProfiler class >> isAbstract [

	^ self = PBAAnalysisProfiler
]

{ #category : 'accessing' }
PBAAnalysisProfiler >> analysis [

	^ analysis
]

{ #category : 'accessing' }
PBAAnalysisProfiler >> analysis: someAnalysis [

	analysis := someAnalysis
]

{ #category : 'testing' }
PBAAnalysisProfiler >> analyze: aTargetProgram [

	self subclassResponsibility 
]
