Class {
	#name : 'BaselineOfPBA',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfPBA',
	#package : 'BaselineOfPBA'
}

{ #category : 'baselines' }
BaselineOfPBA >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec baseline: 'SMark' with: [ spec repository: 'github://smarr/SMark' ].
		spec package: 'SMark' with: [ spec requires: #( 'SMark-DeltaBlue' 'SMark-Richards' ) ].
		spec package: 'PBA' with: [ spec requires: #( 'SMark' ) ]
	]
]
