Class {
	#name : 'BlocBenchmarkExamples',
	#superclass : 'TestCase',
	#category : 'PBA-Libraries usages',
	#package : 'PBA',
	#tag : 'Libraries usages'
}

{ #category : 'as yet unclassified' }
BlocBenchmarkExamples >> addABlElement [

	<script: ' self new addABlElement'>
	| elem |
	
	"Generating a an bloc element using PBT"
	elem := PBTBlocBenchsTest new blElementConstraint gen.

	BlElement new addChild: elem
]

{ #category : 'as yet unclassified' }
BlocBenchmarkExamples >> runBlBlocCase [

	<script: ' self new runBlBlocCase'>
	| elem time |
	
	"Generating a an bloc element using PBT"
	elem := PBTBlocBenchsTest new blElementConstraint gen.
	time := 500 milliSeconds.

	(BlBBlocPBTCase new element: elem) duration: time; run
]
