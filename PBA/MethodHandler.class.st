Class {
	#name : 'MethodHandler',
	#superclass : 'MpHandler',
	#instVars : [
		'method',
		'count'
	],
	#category : 'PBA-MethodProfiler',
	#package : 'PBA',
	#tag : 'MethodProfiler'
}

{ #category : 'initialization' }
MethodHandler >> beforeExecutionWithReceiver: receiver arguments: arguments [

	self count: self count + 1
]

{ #category : 'accessing' }
MethodHandler >> count [

	count ifNil: [ self count: 0 ].
	
	^ count
]

{ #category : 'initialization' }
MethodHandler >> count: anInteger [

	count := anInteger
]

{ #category : 'initialization' }
MethodHandler >> initialize [

	super initialize.
	self count: 0.
]

{ #category : 'accessing' }
MethodHandler >> method [

	^ method 
]

{ #category : 'initialization' }
MethodHandler >> method: aMethod [

	method := aMethod
]
