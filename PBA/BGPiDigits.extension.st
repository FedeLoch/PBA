Extension { #name : 'BGPiDigits' }

{ #category : '*PBA' }
BGPiDigits >> run [

	^ BenchmarkGameSuite new benchPiDigits
]

{ #category : '*PBA' }
BGPiDigits >> runWith: problemSize [

	^ BenchmarkGameSuite new benchPiDigits: problemSize
]
