Class {
	#name : 'PBAProgram',
	#superclass : 'PBABenchmarkTarget',
	#instVars : [
		'block',
		'classesToExecute'
	],
	#category : 'PBA-Target',
	#package : 'PBA',
	#tag : 'Target'
}

{ #category : 'benchmarking' }
PBAProgram class >> from: block [

	^ self new block: block
]

{ #category : 'benchmarking' }
PBAProgram class >> from: block forClasses: classes [

	^ self new block: block; classesToExecute: classes
]

{ #category : 'accessing' }
PBAProgram >> block [

	^ block
]

{ #category : 'accessing' }
PBAProgram >> block: aBlock [

	block := aBlock 
]

{ #category : 'accessing' }
PBAProgram >> classesToExecute [

	^ classesToExecute

]

{ #category : 'accessing' }
PBAProgram >> classesToExecute: classes [

	classesToExecute := classes
]

{ #category : 'initialization' }
PBAProgram >> initialize [ 

	super initialize.
	classesToExecute := {}
]

{ #category : 'accessing' }
PBAProgram >> run [

	^ block value
]
