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
PBAExperiment >> getResultsAndWriteToCSV [

	| analyzer benchmarks results featuresFile |
	analyzer := analyzer := PBAnalyzer new.
	benchmarks := self allBenchmarks collect: [ :bench |
		              PBASmarkBenchmarkpProgram bench: bench ].
	results := analyzer analyzeAll: benchmarks.
	featuresFile := 'features.csv' asFileReference.
	results writeToCsv: featuresFile.
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
	results := self getResultsAndWriteToCSV.
	mTransformed := self pcaWith: results.

	df := DataFrame
		      withRows: mTransformed rows
		      columnNames: #( PCA1 PCA2 ).
	df addColumn: (results columnAt: 1) named: 'execution time'.

	file := 'exp.csv' asFileReference.
	df writeToCsv: file
]
