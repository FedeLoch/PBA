Class {
	#name : 'PBASmarkBenchmarksExperiment',
	#superclass : 'PBAExperiment',
	#category : 'PBA-Experiment',
	#package : 'PBA',
	#tag : 'Experiment'
}

{ #category : 'running' }
PBASmarkBenchmarksExperiment class >> run [

	^ self new runPCAExperiment: 'smark-benchmarks-pca.csv'
]

{ #category : 'as yet unclassified' }
PBASmarkBenchmarksExperiment >> benchmarks [

	^ {
		  SMarkDeltaBlue new.
		  SMarkRichards new.
		  BGBinaryTrees new.
		  BGMeteor new.
		  BGNBody new.
		  BGPiDigits new.
		  BGSpectralNorm new.
		  BGThreadRing new
	}
]

{ #category : 'as yet unclassified' }
PBASmarkBenchmarksExperiment >> runExperiment [

	| benchmarks |
	
	benchmarks := self allBenchmarks collect: [ :bench | PBASmarkBenchmarkpProgram bench: bench ].

	^ self runExperimentAndWriteCSVWith: self allBenchmarks  name: 'smark-benchmarks-features.csv'
]
