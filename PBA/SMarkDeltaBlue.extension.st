Extension { #name : 'SMarkDeltaBlue' }

{ #category : '*PBA' }
SMarkDeltaBlue >> benchDeltaBlue: n [

	DBStrength initialize.
	DBPlanner chainTest: n.
	DBPlanner projectionTest: n.
	^ true
]

{ #category : '*PBA' }
SMarkDeltaBlue >> run [

	^ self benchDeltaBlue
]

{ #category : '*PBA' }
SMarkDeltaBlue >> runWith: problemSize [

	^ self benchDeltaBlue: problemSize
]
