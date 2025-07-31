Class {
	#name : 'PBAAnalysisStrategy',
	#superclass : 'Object',
	#instVars : [
		'analysis'
	],
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'testing' }
PBAAnalysisStrategy class >> isAbstract [

	^ self = PBAAnalysisStrategy
]

{ #category : 'accessing' }
PBAAnalysisStrategy >> analysis [

	^ analysis
]

{ #category : 'accessing' }
PBAAnalysisStrategy >> analysis: someAnalysis [

	analysis := someAnalysis
]

{ #category : 'accessing' }
PBAAnalysisStrategy >> analysisClass [

	^ self subclassResponsibility
]

{ #category : 'testing' }
PBAAnalysisStrategy >> analyze: aTargetProgram [

	self subclassResponsibility 
]

{ #category : 'initialization' }
PBAAnalysisStrategy >> initialize [ 
	
	super initialize.
	analysis := self analysisClass allSubclasses collect: #new
]
