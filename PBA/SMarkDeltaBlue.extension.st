Extension { #name : 'SMarkDeltaBlue' }

{ #category : '*PBA' }
SMarkDeltaBlue >> problemSize [
	<omniUnenforced> "Hint for the OMOP that it is part of the meta infrastructure"
	| ps |
	
	problemSize ifNotNil: [ ^ problemSize ].
	ps := super problemSize.
	
	ps isInteger ifFalse: [	^ self defaultProblemSize].
		
	^ ps
]

{ #category : '*PBA' }
SMarkDeltaBlue >> problemSize: aProblemSize [

	problemSize := aProblemSize 
]

{ #category : '*PBA' }
SMarkDeltaBlue >> run [

	^ self benchDeltaBlue
]
