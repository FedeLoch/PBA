Class {
	#name : 'PBAVeritasDataFrameBenchmarksExperiment',
	#superclass : 'PBAExperiment',
	#category : 'PBA-Experiment',
	#package : 'PBA',
	#tag : 'Experiment'
}

{ #category : 'running' }
PBAVeritasDataFrameBenchmarksExperiment class >> run [

	^ self new runPCAExperiment: 'veritas-benchmarks-pca.csv'
]

{ #category : 'as yet unclassified' }
PBAVeritasDataFrameBenchmarksExperiment >> allBenchmarks [

	^ self benchmarkFiles collect: [ :filename |
		PBAVeritasDataFrameBenchmarkProgram new filename: filename;
		classesToExecute: ('Veritas-DataFrame' asPackage) classes
	].
]

{ #category : 'as yet unclassified' }
PBAVeritasDataFrameBenchmarksExperiment >> benchmarkFiles [

	^ { 
		'tiny_dataset.csv'.
"		'tiny_fifty_times_larger_dataset.csv'.
		'tiny_one_hundred_times_larger_dataset.csv'"
	}
]

{ #category : 'as yet unclassified' }
PBAVeritasDataFrameBenchmarksExperiment >> runExperiment [

	^ self runExperiment: 'veritas-dataFrame-benchmarks-features.csv'
]
