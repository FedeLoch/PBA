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

{ #category : 'analyzing' }
PBAnalyzer >> analyze: aTargetProgram [

	^ analysisStrategies inject: PBAResult new into: [ :result :strategy |
		(strategy analyze: aTargetProgram) merge: result
	] 
]

{ #category : 'analyzing' }
PBAnalyzer >> analyzeAll: targetPrograms [

	| targetResults |
	targetResults := targetPrograms collect: [ :target |
		                 (self analyze: target) analysisResults ].
	results := DataFrame
		           withRows: targetResults
		           rowNames:
		           (targetPrograms collect: [ :target |
			            target benchmark class ])
		           columnNames: targetResults anyOne keys.
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

{ #category : 'writing' }
PBAnalyzer >> resultsToCSV: aFileReference [

	results writeToCsv: aFileReference
]
