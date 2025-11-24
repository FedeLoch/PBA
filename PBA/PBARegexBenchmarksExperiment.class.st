Class {
	#name : 'PBARegexBenchmarksExperiment',
	#superclass : 'PBAExperiment',
	#instVars : [
		'tests'
	],
	#category : 'PBA-Experiment',
	#package : 'PBA',
	#tag : 'Experiment'
}

{ #category : 'running' }
PBARegexBenchmarksExperiment class >> run [

	^ self new runPCAExperiment: 'regexes-benchmarks-pca.csv'
]

{ #category : 'running' }
PBARegexBenchmarksExperiment class >> run: tests [

	^ self new tests: tests; runExperiment: 'regexes-benchmarks-features.csv'
]

{ #category : 'running' }
PBARegexBenchmarksExperiment class >> runFromFile: aFileName [

	| tests |
	tests := (aFileName asFileReference contents substrings:
		          { Character lf }) collect: [ :string |
			         PBTTest new
				         target: RxMatcher >> #matches:;
				         arguments: { string minimalStringMatching };
				         receiver: string asRegex;
				         score: nil;
				         result: nil ].

	^ self run: tests
]

{ #category : 'running' }
PBARegexBenchmarksExperiment class >> runPCA: tests [

	^ self new tests: tests; runPCAExperiment: 'regexes-benchmarks-pca.csv'
]

{ #category : 'accessing' }
PBARegexBenchmarksExperiment >> allBenchmarks [

	^ tests collect: [ :test | PBAPBTBenchmarkProgram test: test ]
]

{ #category : 'as yet unclassified' }
PBARegexBenchmarksExperiment >> runExperiment [

	^ self runExperiment: 'regexes-benchmarks-features.csv'
]

{ #category : 'as yet unclassified' }
PBARegexBenchmarksExperiment >> runExperimentMethodsCalled [

	^ self
		  runExperiment: 'regexes-benchmarks-features.csv'
		  profilers: { PBAMethodProfiler new }
]

{ #category : 'accessing' }
PBARegexBenchmarksExperiment >> tests: someTests [

	tests := someTests 
]
