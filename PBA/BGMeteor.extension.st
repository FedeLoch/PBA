Extension { #name : 'BGMeteor' }

{ #category : '*PBA' }
BGMeteor >> run [

	^ BenchmarkGameSuite new benchMeteor
]

{ #category : '*PBA' }
BGMeteor >> runWith: problemSize [

	^ BenchmarkGameSuite new benchMeteor: problemSize
]
