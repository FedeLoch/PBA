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
	"		spec baseline: 'BenchEvaluation' with: [ spec repository: 'github://FedeLoch/PBE:main' ]."
			spec baseline: 'IllimaniProfiler' with: [ spec repository: 'github://jordanmontt/illimani-memory-profiler:main' ].
			"spec baseline: 'PharoVM' with: [ spec repository: 'github://evref-inria/pharo-vm:pharo-12' ]."
			spec baseline: 'PolyMath' with: [ spec repository: 'github://PolyMathOrg/PolyMath' ].
			spec baseline: 'DataFrame' with: [ spec repository: 'github://PolyMathOrg/DataFrame/src' ].
			spec baseline: 'AILinearModels' with: [ spec repository: 'github://pharo-ai/linear-models/src' ].
			spec baseline: 'AIMetrics' with: [ spec repository: 'github://pharo-ai/metrics' ].
			spec baseline: 'MethodProfiler' with: [ spec repository: 'github://FedeLoch/MethodProfiler:main' ].
			
			{ 'VeritasDataFrame' . "'VeritasCormas' . 'VeritasRewriter' .
				'VeritasReMobidyc' . 'VeritasHoneyGinger' . 'VeritasMoose' .
				'VeritasBloc' . 'VeritasRegis' . 'VeritasMicrodown'" } do: [ :baseline |
				spec baseline: baseline with: [ spec repository: 'github://jordanmontt/PharoVeritasBenchSuite:main' ]
			].
			spec package: 'PBA' with: [
				spec requires: #( 'SMark' 'PBP' "'BenchEvaluation'" 'IllimaniProfiler'
				'VeritasDataFrame' "'VeritasCormas' 'VeritasRewriter'  'VeritasReMobidyc'
				'VeritasHoneyGinger' 'VeritasMoose' 'VeritasBloc' 'VeritasRegis' 'VeritasMicrodown'"
				'PolyMath' 'AILinearModels' 'AIMetrics' 'MethodProfiler' 'DataFrame'
				)
			].
			spec group: 'default' with: #( 'PBA' ) ]
]
