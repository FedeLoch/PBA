Class {
	#name : 'PBAnalyzer',
	#superclass : 'Object',
	#instVars : [
		'results',
		'profilers',
		'logStream'
	],
	#category : 'PBA-Analyzer',
	#package : 'PBA',
	#tag : 'Analyzer'
}

{ #category : 'instance creation' }
PBAnalyzer class >> newWithLogStream: aStream [

	^ self new
		  logStream: aStream;
		  yourself
]

{ #category : 'analyzing' }
PBAnalyzer >> analyze: aTargetProgram [

	| intermediateResult |
	self logAnalyzeTarget: aTargetProgram.
	intermediateResult := profilers
		                      inject: PBAResult new
		                      into: [ :result :profiler |
			                      result merge:
				                      (profiler analyze: aTargetProgram) ].
	self logIntermediateResult: intermediateResult.
	^ intermediateResult
]

{ #category : 'analyzing' }
PBAnalyzer >> analyzeAll: targetPrograms [

	| featureNames intermediateResult firstRowName |
	(targetPrograms isNil or: [ targetPrograms isEmpty ]) ifTrue: [
		^ DataFrame new: 0 @ 0 ].

	intermediateResult := self analyze: targetPrograms first.
	intermediateResult := self flattenResults:
		                      intermediateResult analysisResults.
	featureNames := intermediateResult keys.
	firstRowName := targetPrograms first name , '_' , 1 asString.

	results := targetPrograms allButFirst
		           inject: ((DataFrame withColumnNames: featureNames)
				            addRow: intermediateResult values
				            named: firstRowName)
		           into: [ :df :target |
				           df
					           addRow:
					           (self flattenResults:
						            (self analyze: target) analysisResults) values
					           named: (self rowNameFor: target name in: df) ].
	^ results
]

{ #category : 'flattening' }
PBAnalyzer >> flattenResults: intermediateResult [

	| coverageMetrics memoryMetrics |
	coverageMetrics := intermediateResult removeAt: 'coverage'.
	intermediateResult addAll: coverageMetrics.
	
	memoryMetrics := intermediateResult removeAt: 'memory'.
	intermediateResult addAll: memoryMetrics.
	
	intermediateResult at: 'methodsCalled' put: (intermediateResult at: 'methodsCalled') sum.
	
	^ intermediateResult 
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

{ #category : 'logging' }
PBAnalyzer >> logAnalyzeTarget: aTargetProgram [

	logStream ifNotNil: [
			logStream
				nextPutAll: 'Analyzing ';
				nextPutAll: aTargetProgram name;
				cr;
				flush
	]
]

{ #category : 'logging' }
PBAnalyzer >> logIntermediateResult: intermediateResult [

	logStream ifNotNil: [
			logStream
				nextPutAll: 'Intermediate result: ';
				cr.
			intermediateResult analysisResults associationsDo: [ :assoc |
					logStream
						tab;
						nextPutAll: assoc key;
						nextPutAll: ',';
						nextPutAll: assoc value asString;
						cr ].
			logStream
				cr;
				flush ]
]

{ #category : 'accessing' }
PBAnalyzer >> logStream [

	^ logStream
]

{ #category : 'accessing' }
PBAnalyzer >> logStream: anObject [

	logStream := anObject
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
