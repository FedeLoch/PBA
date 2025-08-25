Class {
	#name : 'PBAExperiment',
	#superclass : 'Object',
	#instVars : [
		'pca'
	],
	#category : 'PBA-Experiment',
	#package : 'PBA',
	#tag : 'Experiment'
}

{ #category : 'accessing' }
PBAExperiment >> benchmarks [

	^ self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
PBAExperiment >> executionTimeLabel [

	^ 'execution time'
]

{ #category : 'accessing' }
PBAExperiment >> linearRegressionWith: dataframe [

	| y x normalizedX linearRegressionModel linearRegressionDict predictedValues costHistory weights bias |
	y := (dataframe columnAt: 1) values.
	x := (dataframe columnsFrom: 2 to: dataframe numberOfColumns)
		     asArrayOfRows.

	normalizedX := AIStandardizationNormalizer new normalize: x.

	linearRegressionModel := AILinearRegression new
		                         learningRate: 0.01;
		                         maxIterations: 2000;
		                         yourself.

	linearRegressionModel fitX: normalizedX y: y.
	predictedValues := linearRegressionModel predict: normalizedX.
	costHistory := linearRegressionModel costHistory.
	weights := linearRegressionModel weights.
	bias := linearRegressionModel bias.

	linearRegressionDict := Dictionary newFrom: {
			                        ('weights' -> weights).
			                        ('bias' -> bias).
			                        ('costs' -> costHistory) }
]

{ #category : 'accessing' }
PBAExperiment >> pcaComponentInformationShare [
	"This represents how much information from the original dataset each principal component holds"

	| eigenvalues |
	eigenvalues := pca jacobiTransform eigenvalues.
	^ eigenvalues / eigenvalues sum
]

{ #category : 'accessing' }
PBAExperiment >> pcaComponentWeights [
	"Each row is the weights of a given principal component for each original features"

	^ pca jacobiTransform transform
]

{ #category : 'as yet unclassified' }
PBAExperiment >> pcaWith: results [

	| matrix standardizedMatrix |
	"PCA will be trained on everything but the first parameter ( execution time )"
	matrix := PMMatrix rows:
		          (results columnsFrom: 2 to: results numberOfColumns).

	"We standarize the parameters"
	standardizedMatrix := PMStandardizationScaler new fitAndTransform:
		                      matrix.

	"PCA generation"
	pca := PMPrincipalComponentAnalyserJacobiTransformation new
		       componentsNumber: 2;
		       fit: standardizedMatrix.

	^ pca transform: standardizedMatrix
]

{ #category : 'removing' }
PBAExperiment >> removeMeaninglessColumnsFrom: dataframe [
	"Meaningless columns are those with only one value for all rows, so a standard deviation of 0"

	dataframe removeColumns: (dataframe columnNames select: [ :colName |
			 (dataframe column: colName) stdev = 0 ])
]

{ #category : 'as yet unclassified' }
PBAExperiment >> runExperiment [

	self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
PBAExperiment >> runExperiment: fileName [

	^ self runExperimentAndWriteCSVWith: self allBenchmarks  name: fileName
]

{ #category : 'as yet unclassified' }
PBAExperiment >> runExperimentAndWriteCSVWith: targets name: fileName [

	| featuresResult |

	featuresResult := PBAnalyzer new analyzeAll: targets.
	featuresResult writeToCsv: fileName asFileReference.
	
	^ featuresResult
]

{ #category : 'running' }
PBAExperiment >> runLinearRegressionExperiment: fileName [

	| results cleanResults linearRegressionDict |

	results := self runExperiment.
	cleanResults := self removeMeaninglessColumnsFrom: results.
	linearRegressionDict := self linearRegressionWith: cleanResults.

	self write: linearRegressionDict toJson: fileName
]

{ #category : 'as yet unclassified' }
PBAExperiment >> runPCAExperiment: fileName [

	| results mTransformed pcaDataFrame |

	results := self runExperiment.
	mTransformed := self pcaWith: results.

	pcaDataFrame := DataFrame withRows: mTransformed rows columnNames: #( PCA1 PCA2 ).
	pcaDataFrame addColumn: (results columnAt: 1) named: self executionTimeLabel.

	pcaDataFrame writeToCsv: fileName asFileReference
]

{ #category : 'writing' }
PBAExperiment >> write: aDictionary toJson: aFileName [

	| writeStream writer |
	writeStream := aFileName asFileReference writeStream.
	writer := NeoJSONWriter new on: writeStream.
	writer prettyPrint: true.
	aDictionary neoJsonOn: writer.
	writer close
]
