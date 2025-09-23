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

{ #category : 'as yet unclassified' }
PBABenchmarkTarget >> classesToExecute [

	^ {}
]

{ #category : 'as yet unclassified' }
PBABenchmarkTarget >> methodsToExecute [

	^ self classesToExecute flatCollect: #methods
]

{ #category : 'accessing' }
PBABenchmarkTarget >> name [

	self subclassResponsibility 
]

{ #category : 'converting' }
PBABenchmarkTarget >> run [

	^ self subclassResponsibility 
]
