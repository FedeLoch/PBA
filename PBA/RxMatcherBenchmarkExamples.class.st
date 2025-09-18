Class {
	#name : 'RxMatcherBenchmarkExamples',
	#superclass : 'TestCase',
	#category : 'PBA-Libraries usages',
	#package : 'PBA',
	#tag : 'Libraries usages'
}

{ #category : 'testing' }
RxMatcherBenchmarkExamples >> matches [

	<script: ' self new matches'>
	| regexString string |

	regexString := (PBTGrammarMCTSGenerator from: GncRegexGrammar new) gen: nil by: nil.
	string := regexString minimalStringMatching.
	
	self assert: ((PBTRegex fromString: regexString) matches: string) equals: true.
]
