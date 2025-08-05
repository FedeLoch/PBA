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
		spec baseline: 'SMark' with: [ spec repository: 'github://guillep/SMark' ].
    spec baseline: 'IllimaniProfiler' with: [ spec repository: 'github://jordanmontt/illimani-memory-profiler:main' ].
		spec package: 'PBA' with: [ spec requires: #( 'SMark' 'IllimaniProfiler' ) ].
    
    spec group: 'default' with: #( 'PBA' )
	]
]
