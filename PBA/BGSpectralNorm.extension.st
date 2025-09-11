Extension { #name : 'BGSpectralNorm' }

{ #category : '*PBA' }
BGSpectralNorm >> problemSize [

	^ problemSize 
]

{ #category : '*PBA' }
BGSpectralNorm >> problemSize: aProblemSize [

	problemSize := aProblemSize 
]

{ #category : '*PBA' }
BGSpectralNorm >> run [

	^ BenchmarkGameSuite new benchSpectralNorm
]
