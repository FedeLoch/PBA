Class {
	#name : 'PBASmarkBenchmarkProgram',
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
PBASmarkBenchmarkProgram >> classesToExecute [
	
	^ classesToExecute 
]

{ #category : 'accessing' }
PBASmarkBenchmarkProgram >> classesToExecute: cls [

	classesToExecute := cls
]

{ #category : 'initialization' }
PBASmarkBenchmarkProgram >> initialize [ 

	super initialize.
	classesToExecute := {}
]

{ #category : 'accessing' }
PBASmarkBenchmarkProgram >> name [

	^ benchmark className
]

{ #category : 'accessing' }
PBASmarkBenchmarkProgram >> run [

	^ benchmark run.
]
