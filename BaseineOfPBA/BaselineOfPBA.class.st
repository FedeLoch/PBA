Class {
	#name : 'BaselineOfPBA',
	#superclass : 'Object',
	#category : 'BaseineOfPBA',
	#package : 'BaseineOfPBA'
}

{ #category : 'baselines' }
BaselineOfPBA >> baseline: spec [

	spec for: #common do: [
		spec baseline: 'SMark' with: [ spec repository: 'github://smarr/SMark' ].
		spec package: 'PBA' with: [ spec requires: #( 'SMark' ) ]
	]
]
