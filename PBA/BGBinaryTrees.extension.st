Extension { #name : 'BGBinaryTrees' }

{ #category : '*PBA' }
BGBinaryTrees >> problemSize [

	^ problemSize 
]

{ #category : '*PBA' }
BGBinaryTrees >> problemSize: aProblemSize [

	problemSize := aProblemSize 
]

{ #category : '*PBA' }
BGBinaryTrees >> run [

	^ BenchmarkGameSuite new benchBinaryTrees 
]
