Extension { #name : 'BGFastaCache' }

{ #category : '*PBA' }
BGFastaCache class >> forFasta: anInteger [
	<omniUnenforced>
	Cache ifNil: [Cache := self new].
	^ Cache primeForFasta: anInteger
]
