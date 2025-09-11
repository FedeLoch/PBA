Extension { #name : 'BGChameneosRedux' }

{ #category : '*PBA' }
BGChameneosRedux >> problemSize [

	^ problemSize 
]

{ #category : '*PBA' }
BGChameneosRedux >> problemSize: aProblemSize [

	problemSize := aProblemSize 
]

{ #category : '*PBA' }
BGChameneosRedux >> run [

	^ BenchmarkGameSuite new benchChameneosRedux 
]
