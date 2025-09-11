Extension { #name : 'BGReverseComplement' }

{ #category : '*PBA' }
BGReverseComplement >> problemSize [

	^ problemSize 
]

{ #category : '*PBA' }
BGReverseComplement >> problemSize: aProblemSize [

	problemSize := aProblemSize 
]

{ #category : '*PBA' }
BGReverseComplement >> run [

	^ BenchmarkGameSuite new benchReverseComplement 
]
