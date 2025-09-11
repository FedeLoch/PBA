Class {
	#name : 'PBASMarkBenchmarkExperiment',
	#superclass : 'PBAExperiment',
	#instVars : [
		'benchmark',
		'problemSizes'
	],
	#category : 'PBA-Experiment',
	#package : 'PBA',
	#tag : 'Experiment'
}

{ #category : 'benchmarking' }
PBASMarkBenchmarkExperiment class >> bench: bechmark with: iterations [

	^ self new bechmark: bechmark; problemSizes: iterations; run
]

{ #category : 'running' }
PBASMarkBenchmarkExperiment class >> iterations [

	^ ((1 to: 9) flatCollect: [  :i | (1 to: 6) collect: [ :j | i * (10 raisedTo: j) ] ]) sort
]

{ #category : 'running' }
PBASMarkBenchmarkExperiment class >> run [

{
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
} do: [ :bench | self bench: bench with: self iterations ]
 
]

{ #category : 'as yet unclassified' }
PBASMarkBenchmarkExperiment >> allBenchmarks [ 

	^ problemSizes collect: [ :size |
		(PBABenchmarkProgram bench: (benchmark new problemSize: size)) classesToExecute:
			  benchmark package classes
	]
]

{ #category : 'as yet unclassified' }
PBASMarkBenchmarkExperiment >> bechmark: aBenchmarkClass [

	benchmark := aBenchmarkClass
]

{ #category : 'as yet unclassified' }
PBASMarkBenchmarkExperiment >> problemSizes: iterations [

	problemSizes := iterations
]

{ #category : 'as yet unclassified' }
PBASMarkBenchmarkExperiment >> run [

	^ self runExperiment: benchmark name, '-experiment.csv' 
	 
]
