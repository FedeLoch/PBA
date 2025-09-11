Extension { #name : 'BGThreadRing' }

{ #category : '*PBA' }
BGThreadRing >> run [

	^ BenchmarkGameSuite new benchThreadRing
]

{ #category : '*PBA' }
BGThreadRing >> runWith: problemSize [

	^ BenchmarkGameSuite new benchThreadRing: problemSize
]
