Extension { #name : 'BGMandelbrot' }

{ #category : '*PBA' }
BGMandelbrot >> problemSize [

	^ problemSize 
]

{ #category : '*PBA' }
BGMandelbrot >> problemSize: aProblemSize [

	problemSize := aProblemSize 
]

{ #category : '*PBA' }
BGMandelbrot >> run [

	^ BenchmarkGameSuite new benchMandelbrot 
]
