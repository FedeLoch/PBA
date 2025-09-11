Extension { #name : 'BenchmarkGameSuite' }

{ #category : '*PBA' }
BenchmarkGameSuite >> benchBinaryTrees: problemSize [

	^ BGBinaryTrees new binarytrees: problemSize to: (TextStream with: ByteString new)
]

{ #category : '*PBA' }
BenchmarkGameSuite >> benchChameleons: problemSize [
	| result |
	
	result := BGChameleons chameneos: problemSize.
	
	"Result should be 2*numberOfProcesses (as far as I understand the benchmark)"
	self flag: 'TODO adapt once verification is supported'.
	result = (2 * problemSize) ifFalse: [
		Error signal: (BGChameleons name, ' benchmark failed. Input: ', 
								 problemSize asString, ' Output: ', result asString).
	].
]

{ #category : '*PBA' }
BenchmarkGameSuite >> benchChameneosRedux: problemSize [
	
	| result report |
	report := TextStream with: ByteString new.
	result := BGChameneosRedux new runBenchMark: problemSize on: report.
	
	"Result should be 2*problemSize"
	self flag: 'TODO: adapt once verification is supported'.
	result = (2 * problemSize) ifFalse: [
		Error signal: self class name, ' benchmark failed. Input: ',
								 runner processes asString, ' Output: ', result asString  ].
]

{ #category : '*PBA' }
BenchmarkGameSuite >> benchFasta: problemSize [
	| out |
	out := TextStream with: ByteString new.

	BGFasta fasta: problemSize to: out.
]

{ #category : '*PBA' }
BenchmarkGameSuite >> benchKNucleotide: problemSize [
	| bench input result output |
	
	bench := BGKNucleotide new.
	input := ReadStream on: (BGFastaCache forFasta: problemSize).
	result := TextStream with: ByteString new.
	output := bench knucleotide5From: input to: result.
	
	^ output
]

{ #category : '*PBA' }
BenchmarkGameSuite >> benchMandelbrot: problemSize [

	^ BGMandelbrot new mandelbrot2: problemSize
]

{ #category : '*PBA' }
BenchmarkGameSuite >> benchMeteor: problemSize [

	^ BGMeteor meteor: problemSize
]

{ #category : '*PBA' }
BenchmarkGameSuite >> benchNBody: problemSize [

	BGNBody nbody: problemSize
]

{ #category : '*PBA' }
BenchmarkGameSuite >> benchPiDigits: problemSize [

	^ BGPiDigits piDigits: problemSize
]

{ #category : '*PBA' }
BenchmarkGameSuite >> benchRegexDNA: problemSize [

	BGRegexDNA regexdna: problemSize
]

{ #category : '*PBA' }
BenchmarkGameSuite >> benchReverseComplement: problemSize [
	
	BGReverseComplement revcomp: problemSize
]

{ #category : '*PBA' }
BenchmarkGameSuite >> benchSpectralNorm: problemSize [

	^ BGSpectralNorm new spectralnorm: problemSize

]

{ #category : '*PBA' }
BenchmarkGameSuite >> benchThreadRing: problemSize [

	^ BGThreadRing threadring: problemSize
]
