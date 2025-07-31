Class {
	#name : 'PBAnalyzer',
	#superclass : 'Object',
	#instVars : [
		'analysisStrategies',
		'results'
	],
	#category : 'PBA-Analyzer',
	#package : 'PBA',
	#tag : 'Analyzer'
}

{ #category : 'accessing' }
PBAnalyzer >> analysisStrategies [

	^ analysisStrategies
]

{ #category : 'accessing' }
PBAnalyzer >> analysisStrategies: someAnalysisStrategies [

	analysisStrategies := someAnalysisStrategies
]

{ #category : 'analyzing' }
PBAnalyzer >> analyze: aTargetProgram [

	^ analysisStrategies inject: PBAResult new into: [ :result :strategy |
		result merge: (strategy analyze: aTargetProgram)
	] 
]

{ #category : 'analyzing' }
PBAnalyzer >> analyzeAll: targetPrograms [

	| featureNames |
	featureNames := (analysisStrategies collect: [ :strat |
		                 strat analysis collect: #defaultFeatureName ])
		                flattened.
	results := targetPrograms
		           inject: (DataFrame withColumnNames: featureNames)
		           into: [ :df :target |
			           df
				           addRow: (self analyze: target) analysisResults values
				           named:
				           (self rowNameFor: target benchmark className in: df) ].
	^ results
]

{ #category : 'initialization' }
PBAnalyzer >> initialize [ 
	
	super initialize.
	analysisStrategies := {
		PBACallBacksStrategy new.
		PBAIllimaniStrategy new.
		"TODO: Insert instances of analysis strategies here"
	}
	
]

{ #category : 'accessing' }
PBAnalyzer >> results [

	^ results
]

{ #category : 'accessing' }
PBAnalyzer >> results: someResults [

	results := someResults
]

{ #category : 'writing' }
PBAnalyzer >> resultsToCSV: aFileReference [

	aFileReference deleteIfAbsent: [].
	results writeToCsv: aFileReference
]

{ #category : 'accessing' }
PBAnalyzer >> rowNameFor: aBenchmark in: dataframe [
	"Row names have to be unique, the numbers matter little as long as the rows have different names"

	| matchingNames oldId newId |
	dataframe row: aBenchmark , '_1' ifAbsent: [ ^ aBenchmark , '_1' ].

	matchingNames := dataframe rowNames select: [ :rowName |
		                 aBenchmark , '*' match: rowName ].

	oldId := (matchingNames last substrings: '_') last.
	newId := (oldId asInteger + 1) asString.
	
	^ aBenchmark , '_' , newId
]
