Class {
	#name : 'PBAVeritasBenchmarkProgram',
	#superclass : 'PBABenchmarkTarget',
	#instVars : [
		'filename'
	],
	#category : 'PBA-Target',
	#package : 'PBA',
	#tag : 'Target'
}

{ #category : 'benchmarking' }
PBAVeritasBenchmarkProgram class >> bench: smarkBench [

	^ self new benchmark: smarkBench.
]

{ #category : 'accessing' }
PBAVeritasBenchmarkProgram >> filename [ 

	^ filename
]

{ #category : 'accessing' }
PBAVeritasBenchmarkProgram >> filename: aFilename [

	filename := aFilename
]

{ #category : 'accessing' }
PBAVeritasBenchmarkProgram >> run [

	^ ACExDataFrame new run: filename
]
