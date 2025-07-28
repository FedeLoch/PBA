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
