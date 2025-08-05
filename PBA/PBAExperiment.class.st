Class {
	#name : 'PBAExperiment',
	#superclass : 'Object',
	#category : 'PBA-Experiment',
	#package : 'PBA',
	#tag : 'Experiment'
}

{ #category : 'accessing' }
PBAExperiment >> allBenchmarks [

	^ {
		  SMarkDeltaBlue new.
		  SMarkRichards new.
		  BGBinaryTrees new.
		  BGMeteor new.
		  BGNBody new.
		  BGPiDigits new.
		  BGSpectralNorm new.
		  BGThreadRing new }
]

{ #category : 'as yet unclassified' }
PBAExperiment >> getResults [

	| analyzer benchmarks results |
	analyzer := analyzer := PBAnalyzer new.
	benchmarks := self allBenchmarks collect: [ :bench |
		              PBASmarkBenchmarkpProgram bench: bench ].
	results := analyzer analyzeAll: benchmarks.
	^ results
]

{ #category : 'as yet unclassified' }
PBAExperiment >> pcaWith: results [

	| contents m mStandardized pca mTransformed |
	contents := results columnsFrom: 2 to: results numberOfColumns. "PCA will be trained on everything but the execution time"
	m := PMMatrix rows: contents.
	mStandardized := PMStandardizationScaler new fitAndTransform: m.
	pca := PMPrincipalComponentAnalyserJacobiTransformation new.
	pca componentsNumber: 2.
	pca fit: mStandardized.
	mTransformed := pca transform: mStandardized.
	^ mTransformed
]

{ #category : 'as yet unclassified' }
PBAExperiment >> runExperiment [

	| results mTransformed df file |
	results := self getResults.
	mTransformed := self pcaWith: results.

	df := DataFrame
		      withRows: mTransformed rows
		      columnNames: #( PCA1 PCA2 ).
	df addColumn: (results columnAt: 1) named: 'execution time'.

	file := 'exp.csv' asFileReference.
	df writeToCsv: file
]
