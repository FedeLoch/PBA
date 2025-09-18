Class {
	#name : 'IllimaniBenchmarkExamples',
	#superclass : 'TestCase',
	#category : 'PBA-Libraries usages',
	#package : 'PBA',
	#tag : 'Libraries usages'
}

{ #category : 'as yet unclassified' }
IllimaniBenchmarkExamples >> profileFor [

	<script: 'self new profileFor'>
	| time |
	
	time := (1 to: 5) atRandom seconds.
	
	FiLiP new profileFor: time
]

{ #category : 'as yet unclassified' }
IllimaniBenchmarkExamples >> profileOn [

	<script: 'self new profileOn'>
	| block |
	
	block := [ 15 timesRepeat: [ StPlaygroundPresenter open close ] ].
	
	FiLiP new profileOn: block.
]
