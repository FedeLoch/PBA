Extension { #name : 'BGChameneosRedux' }

{ #category : '*PBA' }
BGChameneosRedux >> run [

	^ BenchmarkGameSuite new benchChameneosRedux 
]

{ #category : '*PBA' }
BGChameneosRedux >> runWith: problemSize [

	^ BenchmarkGameSuite new benchChameneosRedux: problemSize 
]
