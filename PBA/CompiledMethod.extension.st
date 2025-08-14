Extension { #name : 'CompiledMethod' }

{ #category : '*PBA' }
CompiledMethod class >> loopSelectors [

	^ {
		#timesRepeat:.
		#to:do:.
		#to:by:do:.
		#do:
	}
]
