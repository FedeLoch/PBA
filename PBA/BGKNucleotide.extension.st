Extension { #name : 'BGKNucleotide' }

{ #category : '*PBA' }
BGKNucleotide >> problemSize [

	^ problemSize 
]

{ #category : '*PBA' }
BGKNucleotide >> problemSize: aProblemSize [

	problemSize := aProblemSize 
]

{ #category : '*PBA' }
BGKNucleotide >> run [

	^ BenchmarkGameSuite new benchKNucleotide 
]
