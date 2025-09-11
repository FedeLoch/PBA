Extension { #name : 'BGReverseComplement' }

{ #category : '*PBA' }
BGReverseComplement >> run [

	^ BenchmarkGameSuite new benchReverseComplement 
]

{ #category : '*PBA' }
BGReverseComplement >> runWith: problemSize [

	^ BenchmarkGameSuite new benchReverseComplement: problemSize
]
