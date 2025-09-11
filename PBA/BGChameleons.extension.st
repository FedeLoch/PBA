Extension { #name : 'BGChameleons' }

{ #category : '*PBA' }
BGChameleons >> run [

	^ BenchmarkGameSuite new benchChameleons 
]

{ #category : '*PBA' }
BGChameleons >> runWith: problemSize [

	^ BenchmarkGameSuite new benchChameleons: problemSize
]
