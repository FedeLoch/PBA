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
			spec baseline: 'PBP' with: [ spec repository: 'github://FedeLoch/PBP:main' ].
			spec baseline: 'IllimaniProfiler' with: [ spec repository: 'github://jordanmontt/illimani-memory-profiler:main' ].
			spec baseline: 'PolyMath' with: [ spec repository: 'github://PolyMathOrg/PolyMath' ].
			
			spec baseline: 'SMark' with: [ spec repository: 'github://guillep/SMark' ].
			spec baseline: 'DataFrame' with: [ spec repository: 'github://PolyMathOrg/DataFrame:pre-v3/src' ].
			
			{ 'VeritasDataFrame' . 'VeritasCormas' . 'VeritasRewriter' .
				'VeritasReMobydyc' . 'VeritasHoneyGinger' . 'VeritasMoose' .
				'VeritasBloc' . 'VeritasRegis' . 'VeritasMicrodown' } do: [ :baseline |
				spec baseline: baseline with: [ spec repository: 'github://jordanmontt/PharoVeritasBenchSuite:main' ]
			].
			
			spec package: 'PBA' with: [
				spec requires: #( 'SMark' 'PBP' 'IllimaniProfiler' 'VeritasDataFrame' 'VeritasCormas'
					'VeritasRewriter'  'VeritasReMobydyc' 'VeritasHoneyGinger' 'VeritasMoose' 'VeritasBloc'
					'VeritasRegis' 'VeritasMicrodown' 'DataFrame' 'PolyMath'
				)
			].
			spec group: 'default' with: #( 'PBA' ) ]
]
