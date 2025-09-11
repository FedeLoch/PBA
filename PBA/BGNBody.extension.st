Extension { #name : 'BGNBody' }

{ #category : '*PBA' }
BGNBody >> run [

	^ BenchmarkGameSuite new benchNBody
]

{ #category : '*PBA' }
BGNBody >> runWith: problemSize [

	^ BenchmarkGameSuite new benchNBody: problemSize
]
