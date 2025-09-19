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
		'tiny_dataset.csv'. "2,3 mb"
		"'tiny_ten_times_larger_dataset.csv'. ""23,4 mb""
		'tiny_fifty_times_larger_dataset.csv'. ""117 mb"""
		"'tiny_one_hundred_times_larger_dataset.csv'. ""234 mb""
		'tiny_two_hundred_times_larger_dataset.csv' ""468 mb"""
	}
]
