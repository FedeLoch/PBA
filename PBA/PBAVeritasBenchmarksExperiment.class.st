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

	^ self new runExperiment
]

{ #category : 'as yet unclassified' }
PBAVeritasBenchmarksExperiment >> allBenchmarks [

	^ self benchmarkClasses collect: [ :benchClass |
		  (PBABenchmarkProgram bench: benchClass new)
				classesToExecute: benchClass package classes
	]
]

{ #category : 'as yet unclassified' }
PBAVeritasBenchmarksExperiment >> benchmarkClasses [

	^ {
		VeritasDataFrame.
		"VeritasCormas. ""<-""
		VeritasRewriterTransformer.
		VeritasRewriterFinder.
		VeritasReMobidyc.
		VeritasHoneyGinger.
		""VeritasMoose. <-""
		""VeritasBloc. <-""
		VeritasMicrodown.
		""VeritasRegis"""
	}
]

{ #category : 'as yet unclassified' }
PBAVeritasBenchmarksExperiment >> runExperiment [

	^ self runExperiment: 'all-veritas-benchmarks-features.csv'
]
