Extension { #name : 'Context' }

{ #category : '*PBA' }
Context >> stackAt: delta [
	
	"0-based"
	^ self at: stackp - delta
]
