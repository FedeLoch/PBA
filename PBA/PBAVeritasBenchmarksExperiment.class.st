Class {
	#name : 'PBAVeritasBenchmarksExperiment',
	#superclass : 'PBAExperiment',
	#instVars : [
		'experiments'
	],
	#category : 'PBA-Experiment',
	#package : 'PBA',
	#tag : 'Experiment'
}

{ #category : 'running' }
PBAVeritasBenchmarksExperiment class >> run [

	^ self new runPCAExperiment: 'all-veritas-benchmarks-pca.csv'
]

{ #category : 'as yet unclassified' }
PBAVeritasBenchmarksExperiment >> allBenchmarks [

	^ self benchmarkClasses collect: [ :benchClass |
		PBASmarkBenchmarkProgram bench: benchClass new
	]
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
PBAVeritasBenchmarksExperiment >> benchmarkFiles [

	^ { 
		'tiny_dataset.csv'.
"		'tiny_fifty_times_larger_dataset.csv'.
		'tiny_one_hundred_times_larger_dataset.csv'"
	}
]

{ #category : 'as yet unclassified' }
PBAVeritasBenchmarksExperiment >> initialize [
	
	super initialize.
	experiments := {
		PBAMemoryBenchmarksExperiment new
	}
]

{ #category : 'as yet unclassified' }
PBAVeritasBenchmarksExperiment >> runExperiment [

	^ self runExperiment: 'veritas-benchmarks-features.csv'
]
