Extension { #name : 'CompiledMethod' }

{ #category : '*PBA' }
CompiledMethod >> isLoop [

	^ CompiledMethod loopSelectors includes: self selector
]

{ #category : '*PBA' }
CompiledMethod class >> loopSelectors [

	^ {
		#timesRepeat:.
		#to:do:.
		#to:by:do:.
		#do:
	}
]
