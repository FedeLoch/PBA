Class {
	#name : 'PBAExperiment',
	#superclass : 'Object',
	#instVars : [
		'pca',
		'standardizer',
		'linearRegressionModel',
		'logFile',
		'logStream',
		'analyzer'
	],
	#category : 'PBA-Experiment',
	#package : 'PBA',
	#tag : 'Experiment'
}

{ #category : 'accessing' }
PBAExperiment >> allBenchmarks [

	^ self subclassResponsibility
]

{ #category : 'running' }
PBAExperiment >> analyzer [

	^ analyzer ifNil: [
		  analyzer := PBAnalyzer newWithLogStream: logStream ]
]

{ #category : 'accessing' }
PBAExperiment >> benchmarks [

	^ self subclassResponsibility 
]

{ #category : 'initialization' }
PBAExperiment >> defaultLogFile [

	^ ('../' , self className , '.log') asFileReference
]

{ #category : 'accessing' }
PBAExperiment >> executionTimeLabel [

	^ 'execution time'
]

{ #category : 'accessing' }
PBAExperiment >> getPreprocessedResults [

	| results standardizedResults |
	results := self runExperiment.
	self removeUselessColumnsFrom: results.
	standardizedResults := standardizer normalize: results.

	^ standardizedResults
]

{ #category : 'initialization' }
PBAExperiment >> initialize [

	standardizer := AIStandardizationNormalizer new.
	logFile := self defaultLogFile
]

{ #category : 'accessing' }
PBAExperiment >> learnModelAndGetMSEFrom: x and: y with: learningRate and: maxIter [
	"If learningRate is nil, it is assume that maxIter is nil as well and that the least squares method should be used"

	| predictedValues xMatrix |
	^ learningRate
		  ifNil: [
			  xMatrix := AIColumnMajorMatrix rows: x.
			  linearRegressionModel := AILinearRegressionLeastSquares new.
			  linearRegressionModel fitX: xMatrix y: y.
			  predictedValues := linearRegressionModel predict: x.
			  AIMeanSquaredError new
				  computeForActual: y
				  predicted: predictedValues ]
		  ifNotNil: [
			  linearRegressionModel := AILinearRegression new
				                           learningRate: learningRate;
				                           maxIterations: maxIter;
				                           yourself.
			  linearRegressionModel fitX: x y: y.
			  linearRegressionModel costHistory ]
]

{ #category : 'accessing' }
PBAExperiment >> linearRegressionWith: dataframe learningRate: learningRate maxIterations: maxIter [

	| y x weights bias mse features |
	y := (dataframe columnAt: 1) values.
	x := (dataframe columnsFrom: 2 to: dataframe numberOfColumns)
		     asArrayOfRows.

	mse := self
		       learnModelAndGetMSEFrom: x
		       and: y
		       with: learningRate
		       and: maxIter.

	weights := linearRegressionModel weights.
	bias := linearRegressionModel bias.
	features := dataframe columnNames allButFirst.

	^ Dictionary newFrom: {
			  ('features' -> features).
			  ('weights' -> weights).
			  ('bias' -> bias).
			  ('mse' -> mse) }
]

{ #category : 'logging' }
PBAExperiment >> logEndExperiment [

	logStream
		nextPutAll: 'Ending experiment ';
		nextPutAll: self className;
		cr;
		close
]

{ #category : 'logging' }
PBAExperiment >> logEndWritingCsv [

	logStream
		nextPutAll: 'Finished writing CSV';
		cr;
		cr;
		flush
]

{ #category : 'logging' }
PBAExperiment >> logStartExperiment [

	logStream := logFile writeStream.
	logStream
		nextPutAll: 'Starting experiment ';
		nextPutAll: self className;
		cr;
		cr;
		flush
]

{ #category : 'logging' }
PBAExperiment >> logStartWritingCsv [

	logStream
		nextPutAll: 'Writing CSV';
		cr;
		flush
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

	| matrix |
	"PCA will be trained on everything but the first parameter ( execution time )"
	matrix := PMMatrix rows:
		          (results columnsFrom: 2 to: results numberOfColumns).

	"PCA generation"
	pca := PMPrincipalComponentAnalyserJacobiTransformation new
		       componentsNumber: 2;
		       fit: matrix.

	^ pca transform: matrix
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

	^ self runExperiment: fileName profilers: {
			  PBACallBacksProfiler new.
			  PBACoverageCollectorProfiler new.
			  PBAIllimaniProfiler new.
			  PBAMethodProfiler new.
			  PBABytecodeProfiler new }
]

{ #category : 'running' }
PBAExperiment >> runExperiment: fileName profilers: profilers [

	| results |
	self logStartExperiment.
	results := self
		           runExperimentAndWriteCSVWith: self allBenchmarks
		           name: fileName
		           profilers: profilers.
	self logEndExperiment.
	^ results
]

{ #category : 'running' }
PBAExperiment >> runExperimentAndWriteCSVWith: targets name: fileName profilers: profilers [

	| featuresResult |
	featuresResult := self analyzer
		                  profilers: profilers;
		                  analyzeAll: targets.

	self logStartWritingCsv.
	featuresResult writeToCsv: fileName asFileReference.
	self logEndWritingCsv.

	^ featuresResult
]

{ #category : 'running' }
PBAExperiment >> runLinearRegressionExperiment: fileName withLearningRate: learningRate andMaxIterations: maxIter [

	| results linearRegressionDict |
	results := self getPreprocessedResults.
	linearRegressionDict := self
		                        linearRegressionWith: results
		                        learningRate: learningRate
		                        maxIterations: maxIter.

	self write: linearRegressionDict toJson: fileName
]

{ #category : 'running' }
PBAExperiment >> runLinearRegressionGDExperiment: fileName withLearningRate: learningRate andMaxIterations: maxIter [

	self
		runLinearRegressionExperiment: fileName
		withLearningRate: learningRate
		andMaxIterations: maxIter
]

{ #category : 'running' }
PBAExperiment >> runLinearRegressionLSExperiment: fileName [

	self
		runLinearRegressionExperiment: fileName
		withLearningRate: nil
		andMaxIterations: nil
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
