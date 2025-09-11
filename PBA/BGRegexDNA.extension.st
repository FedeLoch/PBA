Extension { #name : 'BGRegexDNA' }

{ #category : '*PBA' }
BGRegexDNA >> problemSize [
	
	^ problemSize
]

{ #category : '*PBA' }
BGRegexDNA >> problemSize: aProblemSize [

	problemSize := aProblemSize 
]

{ #category : '*PBA' }
BGRegexDNA >> run [

	^ BenchmarkGameSuite new benchRegexDNA 
]
