Class {
	#name : 'PBASmarkBenchmarkpProgram',
	#superclass : 'PBABenchmarkTarget',
	#instVars : [
		'benchmark'
	],
	#category : 'PBA-Target',
	#package : 'PBA',
	#tag : 'Target'
}

{ #category : 'benchmarking' }
PBASmarkBenchmarkpProgram class >> bench: smarkBench [

	^ self new benchmark: smarkBench.
]

{ #category : 'accessing' }
PBASmarkBenchmarkpProgram >> benchmark: aBenchmark [

	benchmark := aBenchmark
]

{ #category : 'accessing' }
PBASmarkBenchmarkpProgram >> run [

	^ benchmark run.
]
