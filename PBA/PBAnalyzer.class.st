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
PBAnalyzer >> analysisStrategies: anObject [

	analysisStrategies := anObject
]

{ #category : 'analyzing' }
PBAnalyzer >> analyze: aTargetProgram [

	^ analysisStrategies inject: PBAResult new into: [ :result :strategy |
		(strategy analyze: aTargetProgram) merge: result
	] 
]

{ #category : 'analyzing' }
PBAnalyzer >> analyzeAll: targetPrograms [

	| numberOfAnalysis |
	numberOfAnalysis := (analysisStrategies collect: [ :strat |
		                     strat analysis size ]) sum.
	results := targetPrograms
		           inject: (DataFrame new: 0 @ numberOfAnalysis)
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
PBAnalyzer >> results: anObject [

	results := anObject
]

{ #category : 'writing' }
PBAnalyzer >> resultsToCSV: aFileReference [

	results writeToCsv: aFileReference
]

{ #category : 'accessing' }
PBAnalyzer >> rowNameFor: aBenchmark in: dataframe [
	"Row names have to be unique"

	| matchingNames newId |
	dataframe row: aBenchmark , '_1' ifAbsent: [ ^ aBenchmark , '_1' ].
	matchingNames := dataframe rowNames select: [ :rowName |
		                 aBenchmark , '*' match: rowName ].
	newId := ((matchingNames last substrings: '_') last asInteger + 1)
		         asString.
	^ aBenchmark , '_' , newId
]
