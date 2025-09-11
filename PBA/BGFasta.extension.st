Extension { #name : 'BGFasta' }

{ #category : '*PBA' }
BGFasta >> run [

	^ BenchmarkGameSuite new benchFasta 
]

{ #category : '*PBA' }
BGFasta >> runWith: problemSize [ 

	^ BenchmarkGameSuite new benchFasta: problemSize
]
