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
		  (PBABenchmarkProgram bench: bench new) classesToExecute:
			  bench package classes
	]
]

{ #category : 'as yet unclassified' }
PBASmarkBenchmarksExperiment >> benchmarks [

	^ {
		  SMarkDeltaBlue.
		  SMarkRichards.
		  BGBinaryTrees.
		  BGMeteor.
		  BGNBody.
		  BGPiDigits.
		  BGSpectralNorm.
		  BGThreadRing.
		  BGChameleons.
		  BGChameneosRedux.
		  BGFasta.
		  BGKNucleotide.
		  BGMandelbrot.
		  BGRegexDNA.
		  BGReverseComplement.
		  "SMarkSlopstone"
		}
]

{ #category : 'as yet unclassified' }
PBASmarkBenchmarksExperiment >> runExperiment [

	^ self runExperiment: 'smark-benchmarks-features.csv'
]
