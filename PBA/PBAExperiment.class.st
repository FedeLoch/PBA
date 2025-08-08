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

{ #category : 'as yet unclassified' }
PBAExperiment >> allBenchmarks [

	^ self benchmarks collect: [ :bench | PBASmarkBenchmarkpProgram bench: bench ].

]

{ #category : 'accessing' }
PBAExperiment >> benchmarks [

	^ self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
PBAExperiment >> executionTimeLabel [

	^ 'execution time'
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

{ #category : 'as yet unclassified' }
PBAExperiment >> runExperiment [

	self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
PBAExperiment >> runExperiment: fileName [

	^ self runExperimentAndWriteCSVWith: self allBenchmarks  name: fileName
]

{ #category : 'as yet unclassified' }
PBAExperiment >> runExperimentAndWriteCSVWith: benchmarks name: fileName [

	| featuresResult |

	featuresResult := PBAnalyzer new analyzeAll: benchmarks.
	featuresResult writeToCsv: fileName asFileReference.
	
	^ featuresResult
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
