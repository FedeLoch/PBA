Class {
	#name : 'DataFrameBenchmarkExamples',
	#superclass : 'TestCase',
	#category : 'PBA-Libraries usages',
	#package : 'PBA',
	#tag : 'Libraries usages'
}

{ #category : 'as yet unclassified' }
DataFrameBenchmarkExamples >> addRow [

	<script: ' self new addRow'>
	| df |

	df := DataFrame withRows: { { 'a' . 1 } . { 'b' . 2 } . { 'c' . 3 } }.
	
	df addRow: { 'd' . 4 } named: 'd'
]

{ #category : 'as yet unclassified' }
DataFrameBenchmarkExamples >> atatPut [

	<script: ' self new atatPut'>
	| df |

	df := DataFrame withRows: { { 'a' . 1 } . { 'b' . 2 } . { 'c' . 3 } }.
	
	df at: 1 at: 2 put: 42.
]

{ #category : 'as yet unclassified' }
DataFrameBenchmarkExamples >> dataTypes [

	<script: ' self new dataTypes'>
	| df |

	df := DataFrame withRows: { { 'a' . 1 } . { 'b' . 2 } . { 'c' . 3 } }.
	
	self assert: df dataTypes equals: { 1 -> Object . 2 -> SmallInteger } asDictionary.
]
