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
			spec baseline: 'IllimaniProfiler' with: [ spec repository: 'github://jordanmontt/illimani-memory-profiler:main' ].
			spec baseline: 'DataFrame' with: [ spec repository: 'github://PolyMathOrg/DataFrame:pre-v3/src' ].
			"spec baseline: 'PharoVM' with: [ spec repository: 'github://evref-inria/pharo-vm:pharo-12' ]."
			spec package: 'PBA' with: [ spec requires: #( 'SMark' 'IllimaniProfiler' 'DataFrame' ) ].
			spec group: 'default' with: #( 'PBA' ) ]
]
