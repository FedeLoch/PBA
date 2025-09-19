Class {
	#name : 'PBAMemoryBenchmarksExperiment',
	#superclass : 'PBAExperiment',
	#category : 'PBA-Experiment',
	#package : 'PBA',
	#tag : 'Experiment'
}

{ #category : 'running' }
PBAMemoryBenchmarksExperiment class >> run [

	^ self new runExperiment: 'veritas-memory-benchmarks.csv'
]

{ #category : 'accessing' }
PBAMemoryBenchmarksExperiment >> allBenchmarks [

	^ self benchmarkDataFrameFiles collect: [ :filename |
		PBAVeritasDataFrameBenchmarkProgram new filename: filename;
		classesToExecute: ('Veritas-DataFrame' asPackage) classes
	].
]

{ #category : 'accessing' }
PBAMemoryBenchmarksExperiment >> benchmarkDataFrameFiles [

	^ { 
		'dataset.csv'.
		'dataset_2.csv'.
		'dataset_3.csv'.
		'dataset_5.csv'.
		'dataset_7.csv'.
		'dataset_10.csv'.
		'dataset_15.csv'.
		'dataset_20.csv'.
		'dataset_25.csv'.
		'dataset_30.csv'.
		'dataset_40.csv'.
		'dataset_50.csv'.
		'dataset_75.csv'.
		'dataset_100.csv'.
		'dataset_150.csv'.
		'dataset_200.csv'.
		'dataset_250.csv'.
		'dataset_300.csv'.
		'dataset_400.csv'.
		'dataset_500.csv'.
		'dataset_750.csv'.
		'dataset_1000.csv'
	}
]
