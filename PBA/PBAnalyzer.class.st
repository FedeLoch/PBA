Class {
	#name : 'PBAnalyzer',
	#superclass : 'Object',
	#instVars : [
		'results',
		'profilers'
	],
	#category : 'PBA-Analyzer',
	#package : 'PBA',
	#tag : 'Analyzer'
}

{ #category : 'analyzing' }
PBAnalyzer >> analyze: aTargetProgram [

	^ profilers inject: PBAResult new into: [ :result :profiler |
		result merge: (profiler analyze: aTargetProgram)
	] 
]

{ #category : 'analyzing' }
PBAnalyzer >> analyzeAll: targetPrograms [

	| featureNames intermediateResult firstRowName |
	(targetPrograms isNil or: [ targetPrograms isEmpty ]) ifTrue: [
		^ DataFrame new: 0 @ 0 ].

	intermediateResult := self analyze: targetPrograms first.
	featureNames := intermediateResult analysisResults keys.
	firstRowName := targetPrograms first name , '_'
	                , 1 asString.

	results := targetPrograms allButFirst
		           inject: ((DataFrame withColumnNames: featureNames)
				            addRow: intermediateResult analysisResults values
				            named: firstRowName)
		           into: [ :df :target |
				           df
					           addRow: (self analyze: target) analysisResults values
					           named:
					           (self rowNameFor: target name in: df) ].
	^ results
]

{ #category : 'initialization' }
PBAnalyzer >> initialize [ 
	
	super initialize.
	profilers := {
		PBACallBacksProfiler new.
		PBACoverageCollectorProfiler new.
		PBAIllimaniProfiler new.
		PBAMethodProfiler new.
		PBABytecodeProfiler new.
	}
	
]

{ #category : 'accessing' }
PBAnalyzer >> profilers [

	^ profilers 
]

{ #category : 'accessing' }
PBAnalyzer >> profilers: _profilers [

	profilers := _profilers
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

	aFileReference ensureDelete.
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
