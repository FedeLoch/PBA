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

{ #category : 'benchmarking' }
PBAVeritasBenchmarkProgram >> benchmark [
	self shouldBeImplemented.
]

{ #category : 'as yet unclassified' }
PBAVeritasBenchmarkProgram >> classesToExecute [
	
	^ classesToExecute 
]

{ #category : 'accessing' }
PBAVeritasBenchmarkProgram >> classesToExecute: cls [

	classesToExecute := cls
]

{ #category : 'accessing' }
PBAVeritasBenchmarkProgram >> filename [ 

	^ filename
]

{ #category : 'accessing' }
PBAVeritasBenchmarkProgram >> filename: aFilename [

	filename := aFilename
]

{ #category : 'initialization' }
PBAVeritasBenchmarkProgram >> initialize [ 

	super initialize.
	classesToExecute := {}
]

{ #category : 'accessing' }
PBAVeritasBenchmarkProgram >> name [

	^ filename 
]

{ #category : 'accessing' }
PBAVeritasBenchmarkProgram >> run [

	^ VeritasDataFrame new loadFileInDataFrame: filename
]
