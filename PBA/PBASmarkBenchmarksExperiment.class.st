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
PBASmarkBenchmarksExperiment >> allBenchmarks [

	^ self benchmarks collect: [ :bench |
		  (PBASmarkBenchmarkProgram bench: bench) classesToExecute:
			  bench class package classes
	]
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

	^ self runExperiment: 'smark-benchmarks-features.csv'
]
