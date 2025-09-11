Extension { #name : 'BGBinaryTrees' }

{ #category : '*PBA' }
BGBinaryTrees >> run [

	^ BenchmarkGameSuite new benchBinaryTrees 
]

{ #category : '*PBA' }
BGBinaryTrees >> runWith: problemSize [

	^ BenchmarkGameSuite new benchBinaryTrees: problemSize
]
