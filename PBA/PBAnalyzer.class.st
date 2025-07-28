Class {
	#name : 'PBAnalyzer',
	#superclass : 'Object',
	#instVars : [
		'analysisStrategies'
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

	| results |
	results := targetPrograms collect: [ :target |
		           (self analyze: target) analysisResults ].
	^ DataFrame
		  withRows: results
		  rowNames:
		  (targetPrograms collect: [ :target | target benchmark class ])
		  columnNames: results anyOne keys
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
