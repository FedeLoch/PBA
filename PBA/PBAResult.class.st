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
PBAResult >> associations [ 
	
	^ analysisResults associations 
]

{ #category : 'accessing' }
PBAResult >> at: index [

	^ analysisResults at: index 
]

{ #category : 'accessing' }
PBAResult >> at: index put: value [

	analysisResults at: index put: value.
	^ self
]

{ #category : 'initialization' }
PBAResult >> initialize [ 
	
	super initialize.
	analysisResults := Dictionary new.
]

{ #category : 'initialization' }
PBAResult >> merge: anotherResult [
	
	anotherResult associations do: [ :assoc |
		analysisResults at: assoc key put: assoc value	
	].

	^ self
]
