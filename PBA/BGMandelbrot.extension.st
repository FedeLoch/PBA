Extension { #name : 'BGMandelbrot' }

{ #category : '*PBA' }
BGMandelbrot >> run [

	^ BenchmarkGameSuite new benchMandelbrot 
]

{ #category : '*PBA' }
BGMandelbrot >> runWith: problemSize [

	^ BenchmarkGameSuite new benchMandelbrot: problemSize
]
