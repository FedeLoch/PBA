Extension { #name : 'BGMeteor' }

{ #category : '*PBA' }
BGMeteor >> problemSize [

	^ problemSize 
]

{ #category : '*PBA' }
BGMeteor >> problemSize: aProblemSize [

	problemSize := aProblemSize 
]

{ #category : '*PBA' }
BGMeteor >> run [

	^ BenchmarkGameSuite new benchMeteor
]
