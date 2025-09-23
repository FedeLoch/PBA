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

{ #category : 'instance creation' }
PBAResult class >> from: dict [

	^ self new merge: dict
]

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

{ #category : 'as yet unclassified' }
PBAResult >> coverage [

	^ self at: PBACoverageCollectorProfiler coverageKey
]

{ #category : 'as yet unclassified' }
PBAResult >> executionTime [

	^ self at: PBAExecutionTimeAnalysis key
]

{ #category : 'initialization' }
PBAResult >> initialize [

	super initialize.
	analysisResults := DataSeries new
]

{ #category : 'initialization' }
PBAResult >> merge: anotherResult [
	
	anotherResult associations do: [ :assoc |
		analysisResults at: assoc key put: assoc value	
	].

	^ self
]

{ #category : 'as yet unclassified' }
PBAResult >> methodsCalled [

	^ self at: PBAMethodProfiler methodsCalledKey
]
