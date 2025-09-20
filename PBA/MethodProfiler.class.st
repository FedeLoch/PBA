Class {
	#name : 'MethodProfiler',
	#superclass : 'Object',
	#category : 'PBA-MethodProfiler',
	#package : 'PBA',
	#tag : 'MethodProfiler'
}

{ #category : 'accessing' }
MethodProfiler class >> profile: program [

	^ self profile: program for: (program classesToExecute flatCollect: #methods)
	
	

]

{ #category : 'accessing' }
MethodProfiler class >> profile: block for: methods [

	| handlers methodProxies |

	methodProxies := methods collect: [ :method |
		MpMethodProxy onMethod: method handler: (MethodHandler new method: method)
	].

	handlers := methodProxies collect: #handler.
	
	"Installing method proxies"
	methodProxies do: [ :mp | mp install; enableInstrumentation ].
	
	"Executing"
	block ensure: [ methodProxies do: #uninstall ].

	^ self result: handlers
]

{ #category : 'accessing' }
MethodProfiler class >> result: handlers [

	^ handlers inject: Dictionary new into: [ :dict :handler |
		dict at: handler method name put: handler count; yourself
	]
]
