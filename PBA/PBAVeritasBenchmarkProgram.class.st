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

{ #category : 'benchmarking' }
PBAVeritasBenchmarkProgram >> benchmark [
	self shouldBeImplemented.
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
PBAVeritasBenchmarkProgram >> name [

	^ filename 
]

{ #category : 'accessing' }
PBAVeritasBenchmarkProgram >> run [

	^ ACExDataFrame new run: filename
]
