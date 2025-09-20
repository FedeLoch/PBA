Class {
	#name : 'MethodProfiler',
	#superclass : 'Object',
	#category : 'PBA-MethodProfiler',
	#package : 'PBA',
	#tag : 'MethodProfiler'
}

{ #category : 'accessing' }
MethodProfiler class >> profile: targetProgram [

	| handler mps |
	
	handler :=  self new.
	1 halt.
	mps := (targetProgram classesToExecute flatCollect: #methods) collect: [ :method |
		MpMethodProxy  onMethod: method handler: handler
	].
	
	"Installing method proxies"
	mps do: [ :mp | mp install; enableInstrumentation ].
	
	"Executing"
	targetProgram run.
	
	"Unistalling method proxies"
	mps do: [ :mp | mp uninstall ].
	
	^ handler result
	
	

]
