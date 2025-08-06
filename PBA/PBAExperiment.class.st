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

	| analyzer benchmarks featuresResult |
	analyzer := analyzer := PBAnalyzer new.
	benchmarks := self allBenchmarks collect: [ :bench |
		              PBASmarkBenchmarkpProgram bench: bench ].
	featuresResult := analyzer analyzeAll: benchmarks.
	featuresResult writeToCsv: 'features.csv' asFileReference.
	^ featuresResult
]

{ #category : 'as yet unclassified' }
PBAExperiment >> pcaWith: results [

	| contents matrix standardizedMatrix pca |
	contents := results columnsFrom: 2 to: results numberOfColumns. "PCA will be trained on everything but the execution time"
	matrix := PMMatrix rows: contents.
	standardizedMatrix := PMStandardizationScaler new fitAndTransform:
		                      matrix.
	pca := PMPrincipalComponentAnalyserJacobiTransformation new
		       componentsNumber: 2;
		       fit: standardizedMatrix.
	^ pca transform: standardizedMatrix
]

{ #category : 'as yet unclassified' }
PBAExperiment >> runExperiment [

	| results mTransformed pcaDataFrame |
	results := self getResultsAndWriteToCSV.
	mTransformed := self pcaWith: results.

	pcaDataFrame := DataFrame
		             withRows: mTransformed rows
		             columnNames: #( PCA1 PCA2 ).
	pcaDataFrame addColumn: (results columnAt: 1) named: 'execution time'.

	pcaDataFrame writeToCsv: 'pca.csv' asFileReference
]
