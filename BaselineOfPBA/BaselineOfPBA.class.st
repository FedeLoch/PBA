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
			spec baseline: 'PBP' with: [ spec repository: 'github://FedeLoch/PBP:main' ].
			spec baseline: 'BenchEvaluation' with: [ spec repository: 'github://FedeLoch/PBE:main' ].
			spec baseline: 'IllimaniProfiler' with: [ spec repository: 'github://jordanmontt/illimani-memory-profiler:main' ].
			"spec baseline: 'PharoVM' with: [ spec repository: 'github://evref-inria/pharo-vm:pharo-12' ]."
			spec baseline: 'PolyMath' with: [ spec repository: 'github://PolyMathOrg/PolyMath' ].
			spec baseline: 'VeritasDataFrame' with: [ spec repository: 'github://jordanmontt/PharoVeritasBenchSuite:main' ].
			spec package: 'PBA' with: [ spec requires: #( 'SMark' 'PBP' 'BenchEvaluation' 'IllimaniProfiler' 'VeritasDataFrame' 'PolyMath' ) ].
			spec group: 'default' with: #( 'PBA' ) ]
]
