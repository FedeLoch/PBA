Extension { #name : 'BGSpectralNorm' }

{ #category : '*PBA' }
BGSpectralNorm >> run [

	^ BenchmarkGameSuite new benchSpectralNorm
]

{ #category : '*PBA' }
BGSpectralNorm >> runWith: problemSize [

	^ BenchmarkGameSuite new benchSpectralNorm: problemSize
]
