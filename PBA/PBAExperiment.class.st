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
PBAExperiment >> allBenchmarks [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
PBAExperiment >> benchmarks [

	^ self subclassResponsibility 
]

{ #category : 'accessing' }
PBAExperiment >> executionTimeLabel [

	^ 'execution time'
]

{ #category : 'accessing' }
PBAExperiment >> getPreprocessedResults [

	| results |
	results := self runExperiment.
	self removeUselessColumnsFrom: results.

	^ results
]

{ #category : 'accessing' }
PBAExperiment >> linearRegressionGDWith: dataframe learningRate: learningRate maxIterations: maxIter [

	| y x normalizedX linearRegressionModel costHistory weights bias |
	y := (dataframe columnAt: 1) values.
	x := (dataframe columnsFrom: 2 to: dataframe numberOfColumns)
		     asArrayOfRows.
	normalizedX := AIStandardizationNormalizer new normalize: x.

	linearRegressionModel := AILinearRegression new
		                         learningRate: learningRate;
		                         maxIterations: maxIter;
		                         yourself.
	linearRegressionModel fitX: normalizedX y: y.

	costHistory := linearRegressionModel costHistory.
	weights := linearRegressionModel weights.
	bias := linearRegressionModel bias.

	^ Dictionary newFrom: {
			  ('weights' -> weights).
			  ('bias' -> bias).
			  ('costs' -> costHistory) }
]

{ #category : 'accessing' }
PBAExperiment >> linearRegressionLSWith: dataframe [

	| y x xMatrix linearRegressionModel predictedValues weights bias meanSquaredError |
	y := (dataframe columnAt: 1) values.
	x := (dataframe columnsFrom: 2 to: dataframe numberOfColumns)
		     asArrayOfRows.
	xMatrix := AIColumnMajorMatrix rows: x.

	linearRegressionModel := AILinearRegressionLeastSquares new.
	linearRegressionModel fitX: xMatrix y: y.

	predictedValues := linearRegressionModel predict: x.
	meanSquaredError := linearRegressionModel
		                    meanSquaredErrorBetweenActual: y
		                    andPredicted: predictedValues.
	weights := linearRegressionModel weights.
	bias := linearRegressionModel bias.

	^ Dictionary newFrom: {
			  ('weights' -> weights).
			  ('bias' -> bias).
			  ('mse' -> meanSquaredError) }
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

{ #category : 'accessing' }
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
PBAExperiment >> removeUselessColumnsFrom: dataframe [
	"Useless columns are the columns for which all rows have the same value, so a standard deviation of 0. These columns don't carry information, so we can remove them without any risk"

	dataframe removeColumns: (dataframe columnNames select: [ :colName |
			 (dataframe column: colName) stdev = 0 ])
]

{ #category : 'running' }
PBAExperiment >> runExperiment [

	self subclassResponsibility 
]

{ #category : 'running' }
PBAExperiment >> runExperiment: fileName [

	^ self runExperimentAndWriteCSVWith: self allBenchmarks  name: fileName
]

{ #category : 'running' }
PBAExperiment >> runExperimentAndWriteCSVWith: targets name: fileName [

	| featuresResult |

	featuresResult := PBAnalyzer new analyzeAll: targets.
	featuresResult writeToCsv: fileName asFileReference.
	
	^ featuresResult
]

{ #category : 'running' }
PBAExperiment >> runLinearRegressionGDExperiment: fileName withLearningRate: learningRate andMaxIterations: maxIter [

	| results linearRegressionDict |
	results := self getPreprocessedResults.
	linearRegressionDict := self
		                        linearRegressionGDWith: results
		                        learningRate: learningRate
		                        maxIterations: maxIter.

	self write: linearRegressionDict toJson: fileName
]

{ #category : 'running' }
PBAExperiment >> runLinearRegressionLSExperiment: fileName [

	| results linearRegressionDict |
	results := self getPreprocessedResults.
	linearRegressionDict := self linearRegressionLSWith: results.

	self write: linearRegressionDict toJson: fileName
]

{ #category : 'running' }
PBAExperiment >> runPCAExperiment: fileName [

	| results matrixTransformed pcaDataFrame |
	results := self getPreprocessedResults.

	matrixTransformed := self pcaWith: results.
	pcaDataFrame := DataFrame
		                withRows: matrixTransformed rows
		                columnNames: #( PCA1 PCA2 ).
	pcaDataFrame
		addColumn: (results columnAt: 1)
		named: self executionTimeLabel.

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
