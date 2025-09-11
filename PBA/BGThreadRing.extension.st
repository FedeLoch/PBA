Extension { #name : 'BGThreadRing' }

{ #category : '*PBA' }
BGThreadRing >> problemSize [

	^ problemSize 
]

{ #category : '*PBA' }
BGThreadRing >> problemSize: aProblemSize [

	problemSize := aProblemSize 
]

{ #category : '*PBA' }
BGThreadRing >> run [

	^ BenchmarkGameSuite new benchThreadRing
]
