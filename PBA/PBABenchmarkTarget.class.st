Class {
	#name : 'PBABenchmarkTarget',
	#superclass : 'PBATarget',
	#category : 'PBA-Target',
	#package : 'PBA',
	#tag : 'Target'
}

{ #category : 'converting' }
PBABenchmarkTarget >> asContext [

	^ [ self run ] asContext
]

{ #category : 'converting' }
PBABenchmarkTarget >> run [

	^ self subclassResponsibility 
]
