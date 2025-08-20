Class {
	#name : 'PBAVeritasDataFrameBenchmarkProgram',
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
PBAVeritasDataFrameBenchmarkProgram class >> bench: smarkBench [

	^ self new benchmark: smarkBench.
]

{ #category : 'benchmarking' }
PBAVeritasDataFrameBenchmarkProgram >> benchmark [
	self shouldBeImplemented.
]

{ #category : 'as yet unclassified' }
PBAVeritasDataFrameBenchmarkProgram >> classesToExecute [
	
	^ classesToExecute 
]

{ #category : 'accessing' }
PBAVeritasDataFrameBenchmarkProgram >> classesToExecute: cls [

	classesToExecute := cls
]

{ #category : 'accessing' }
PBAVeritasDataFrameBenchmarkProgram >> filename [ 

	^ filename
]

{ #category : 'accessing' }
PBAVeritasDataFrameBenchmarkProgram >> filename: aFilename [

	filename := aFilename
]

{ #category : 'initialization' }
PBAVeritasDataFrameBenchmarkProgram >> initialize [ 

	super initialize.
	classesToExecute := {}
]

{ #category : 'accessing' }
PBAVeritasDataFrameBenchmarkProgram >> name [

	^ filename 
]

{ #category : 'accessing' }
PBAVeritasDataFrameBenchmarkProgram >> run [

	^ VeritasDataFrame new loadFileInDataFrame: filename
]
