Extension { #name : 'BGKNucleotide' }

{ #category : '*PBA' }
BGKNucleotide >> run [

	^ BenchmarkGameSuite new benchKNucleotide 
]

{ #category : '*PBA' }
BGKNucleotide >> runWith: problemSize [

	^ BenchmarkGameSuite new benchKNucleotide: problemSize
]
