Class {
	#name : 'PBAResult',
	#superclass : 'Object',
	#instVars : [
		'analysisResults'
	],
	#category : 'PBA-Result',
	#package : 'PBA',
	#tag : 'Result'
}

{ #category : 'initialization' }
PBAResult >> analysisResults [

	^ analysisResults
]

{ #category : 'initialization' }
PBAResult >> initialize [ 
	
	super initialize.
	analysisResults := Dictionary new.
]

{ #category : 'initialization' }
PBAResult >> merge: anotherResult [
	
	1 halt.
	analysisResults merge: anotherResult analysisResults
]
