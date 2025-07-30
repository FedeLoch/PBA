Class {
	#name : 'PBAAnalysis',
	#superclass : 'Object',
	#instVars : [
		'featureName'
	],
	#category : 'PBA-AnalysisStrategy',
	#package : 'PBA',
	#tag : 'AnalysisStrategy'
}

{ #category : 'testing' }
PBAAnalysis class >> isAbstract [

	^ self = PBAAnalysis
]

{ #category : 'initialization' }
PBAAnalysis >> defaultFeatureName [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
PBAAnalysis >> featureName [

	^ featureName
]

{ #category : 'accessing' }
PBAAnalysis >> featureName: anObject [

	featureName := anObject
]

{ #category : 'initialization' }
PBAAnalysis >> initialize [ 

	featureName := self defaultFeatureName
]

{ #category : 'accessing' }
PBAAnalysis >> putValueFrom: anObject in: result [

	^ result at: featureName put: (self valueToExtractFrom: anObject)
]

{ #category : 'accessing' }
PBAAnalysis >> valueToExtractFrom: anObject [

	^ self subclassResponsibility
]
