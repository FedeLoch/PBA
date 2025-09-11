Extension { #name : 'BGChameleons' }

{ #category : '*PBA' }
BGChameleons >> problemSize [

	^ problemSize 
]

{ #category : '*PBA' }
BGChameleons >> problemSize: aProblemSize [

	problemSize := aProblemSize 
]

{ #category : '*PBA' }
BGChameleons >> run [

	^ BenchmarkGameSuite new benchChameleons 
]
