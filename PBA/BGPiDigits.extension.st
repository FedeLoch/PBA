Extension { #name : 'BGPiDigits' }

{ #category : '*PBA' }
BGPiDigits >> problemSize [

	^ problemSize 
]

{ #category : '*PBA' }
BGPiDigits >> problemSize: aProblemSize [

	problemSize := aProblemSize 
]

{ #category : '*PBA' }
BGPiDigits >> run [

	^ BenchmarkGameSuite new benchPiDigits
]
