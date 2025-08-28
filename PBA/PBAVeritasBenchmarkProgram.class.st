Class {
	#name : 'PBAVeritasBenchmarkProgram',
	#superclass : 'PBABenchmarkTarget',
	#instVars : [
		'filename',
		'benchmark',
		'classesToExecute'
	],
	#category : 'PBA-Target',
	#package : 'PBA',
	#tag : 'Target'
}

{ #category : 'benchmarking' }
PBAVeritasBenchmarkProgram class >> bench: smarkBench [

	^ self new benchmark: smarkBench.
]
