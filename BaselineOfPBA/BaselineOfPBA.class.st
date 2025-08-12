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
			spec baseline: 'DataFrame' with: [ spec repository: 'github://PolyMathOrg/DataFrame:pre-v3/src' ].
			"spec baseline: 'PharoVM' with: [ spec repository: 'github://evref-inria/pharo-vm:pharo-12' ]."
			spec baseline: 'PolyMath' with: [ spec repository: 'github://PolyMathOrg/PolyMath' ].
			spec baseline: 'Veritas' with: [ spec repository: 'github.com/jordanmontt/PharoVeritasBenchSuite:main' ].
			spec package: 'PBA' with: [ spec requires: #( 'SMark' 'IllimaniProfiler' 'Veritas' 'DataFrame' 'PolyMath' ) ].
			spec group: 'default' with: #( 'PBA' ) ]
]
