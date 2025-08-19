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

	^ self benchmarkFiles collect: [ :filename |
		PBAVeritasBenchmarkProgram new filename: filename;
		classesToExecute: ('Veritas-DataFrame' asPackage) classes
	].
]

{ #category : 'as yet unclassified' }
PBAVeritasBenchmarksExperiment >> benchmarkFiles [

	^ { 
		'tiny_dataset.csv'.
		'tiny_fifty_times_larger_dataset.csv'.
		'tiny_one_hundred_times_larger_dataset.csv'
	}
]

{ #category : 'as yet unclassified' }
PBAVeritasBenchmarksExperiment >> runExperiment [

	^ self runExperiment: 'veritas-benchmarks-features.csv'
]
