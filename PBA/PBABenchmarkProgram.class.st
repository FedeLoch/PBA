Class {
	#name : 'PBABenchmarkProgram',
	#superclass : 'PBABenchmarkTarget',
	#instVars : [
		'benchmark',
		'classesToExecute'
	],
	#category : 'PBA-Target',
	#package : 'PBA',
	#tag : 'Target'
}

{ #category : 'benchmarking' }
PBABenchmarkProgram class >> bench: smarkBench [

	^ self new benchmark: smarkBench.
]

{ #category : 'accessing' }
PBABenchmarkProgram >> benchmark [

	^ benchmark
]

{ #category : 'accessing' }
PBABenchmarkProgram >> benchmark: aBenchmark [

	benchmark := aBenchmark
]

{ #category : 'accessing' }
PBABenchmarkProgram >> classesToExecute [
	
	^ classesToExecute 
]

{ #category : 'accessing' }
PBABenchmarkProgram >> classesToExecute: cls [

	classesToExecute := cls
]

{ #category : 'initialization' }
PBABenchmarkProgram >> initialize [ 

	super initialize.
	classesToExecute := {}
]

{ #category : 'accessing' }
PBABenchmarkProgram >> name [

	^ benchmark className
]

{ #category : 'accessing' }
PBABenchmarkProgram >> run [
	^ benchmark run.
]
