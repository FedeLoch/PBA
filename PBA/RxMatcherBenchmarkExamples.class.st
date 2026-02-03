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

	regexString := (UmeGrammarMCTSGenerator from: GncRegexGrammar new) gen: nil.
	string := regexString minimalStringMatching.
	
	self assert: ((UmeRegex fromString: regexString) matches: string) equals: true.
]
