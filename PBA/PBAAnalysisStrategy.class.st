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
PBAAnalysisStrategy >> analysis: anObject [

	analysis := anObject
]

{ #category : 'testing' }
PBAAnalysisStrategy >> analyze: aTargetProgram [

	self subclassResponsibility 
]

{ #category : 'initialization' }
PBAAnalysisStrategy >> initialize [ 
	
	super initialize.
	analysis := {  }
]
