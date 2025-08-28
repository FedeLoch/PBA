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
		'tiny_dataset.csv'.
		'tiny_fifty_times_larger_dataset.csv'.
		'tiny_one_hundred_times_larger_dataset.csv'
	}
]
