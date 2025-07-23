Class {
	#name : 'PBAnalyzer',
	#superclass : 'Object',
	#instVars : [
		'results',
		'analysisStrategies'
	],
	#category : 'PBA-Analyzer',
	#package : 'PBA',
	#tag : 'Analyzer'
}

{ #category : 'initialization' }
PBAnalyzer >> analyze: aTargetProgram [

	^ analysisStrategies inject: PBAResult new into: [ :result :strategy |
		(strategy analyze: aTargetProgram) merge: result
	] 
]

{ #category : 'initialization' }
PBAnalyzer >> initialize [ 
	
	super initialize.
	results := Dictionary new.
	analysisStrategies := {
		PBACallBacksStrategy new.
		PBAIllimaniStrategy new.
		"TODO: Insert instances of analysis strategies here"
	}
	
]
