Class {
	#name : 'PBASmarkBenchmarkProgram',
	#superclass : 'PBABenchmarkTarget',
	#instVars : [
		'benchmark'
	],
	#category : 'PBA-Target',
	#package : 'PBA',
	#tag : 'Target'
}

{ #category : 'benchmarking' }
PBASmarkBenchmarkProgram class >> bench: smarkBench [

	^ self new benchmark: smarkBench.
]

{ #category : 'accessing' }
PBASmarkBenchmarkProgram >> benchmark [

	^ benchmark
]

{ #category : 'accessing' }
PBASmarkBenchmarkProgram >> benchmark: aBenchmark [

	benchmark := aBenchmark
]

{ #category : 'accessing' }
PBASmarkBenchmarkProgram >> run [

	^ benchmark run.
]
