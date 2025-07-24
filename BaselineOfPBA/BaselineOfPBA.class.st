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
		spec baseline: 'Illimani' with: [ spec repository: 'github://jordanmontt/illimani-memory-profiler' ].
		spec baseline: 'SMark' with: [ spec repository: 'github://smarr/SMark' ].
		spec package: 'PBA' with: [ spec requires: #( 'SMark' ) ]
	]
]
