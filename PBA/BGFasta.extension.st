Extension { #name : 'BGFasta' }

{ #category : '*PBA' }
BGFasta >> problemSize [

	^ problemSize 
]

{ #category : '*PBA' }
BGFasta >> problemSize: aProblemSize [

	problemSize := aProblemSize 
]

{ #category : '*PBA' }
BGFasta >> run [

	^ BenchmarkGameSuite new benchFasta 
]
