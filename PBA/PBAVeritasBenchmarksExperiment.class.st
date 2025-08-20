Class {
	#name : 'PBAVeritasBenchmarksExperiment',
	#superclass : 'PBAExperiment',
	#category : 'PBA-Experiment',
	#package : 'PBA',
	#tag : 'Experiment'
}

{ #category : 'running' }
PBAVeritasBenchmarksExperiment class >> run [

	^ self new runPCAExperiment: 'veritas-benchmarks-pca.csv'
]

{ #category : 'as yet unclassified' }
PBAVeritasBenchmarksExperiment >> allBenchmarks [

	^ self benchmarkClasses collect: [ :benchClass |
		PBABenchmarkProgram bench: benchClass new
	].
]

{ #category : 'as yet unclassified' }
PBAVeritasBenchmarksExperiment >> benchmarkClasses [

	^ {
		VeritasDataFrame.
		VeritasCormas.
		VeritasRewriterTransformer.
		VeritasRewriterFinder.
		VeritasReMobidyc.
		VeritasHoneyGinger.
		"VeritasMoose."
		"VeritasBloc."
		VeritasMicrodown.
		"VeritasRegis"
	}
]

{ #category : 'as yet unclassified' }
PBAVeritasBenchmarksExperiment >> runExperiment [

	^ self runExperiment: 'veritas-benchmarks-features.csv'
]
