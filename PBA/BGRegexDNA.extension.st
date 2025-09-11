Extension { #name : 'BGRegexDNA' }

{ #category : '*PBA' }
BGRegexDNA >> run [

	^ BenchmarkGameSuite new benchRegexDNA 
]

{ #category : '*PBA' }
BGRegexDNA >> runWith: problemSize [

	^ BenchmarkGameSuite new benchRegexDNA: problemSize
]
