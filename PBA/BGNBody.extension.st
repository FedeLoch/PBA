Extension { #name : 'BGNBody' }

{ #category : '*PBA' }
BGNBody >> problemSize [

	^ problemSize 
]

{ #category : '*PBA' }
BGNBody >> problemSize: aProblemSize [

	problemSize := aProblemSize 
]

{ #category : '*PBA' }
BGNBody >> run [

	^ BenchmarkGameSuite new benchNBody
]
