Class {
	#name : 'BaselineOfPBA',
	#superclass : 'Object',
	#category : 'BaselineOfPBA',
	#package : 'BaselineOfPBA'
}

{ #category : 'baselines' }
BaselineOfPBA >> baseline: spec [

	spec for: #common do: [
		spec baseline: 'SMark' with: [ spec repository: 'github://smarr/SMark' ].
		spec package: 'PBA' with: [ spec requires: #( 'SMark' ) ]
	]
]
