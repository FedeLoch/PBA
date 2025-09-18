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

{ #category : 'as yet unclassified' }
DataFrameBenchmarkExamples >> readFromCsv [

	<script: ' self new readFromCsv'>
	| path |

	path := '/Users/fede/Downloads/MOCK_DATA.csv' asFileReference.
	
	self assert: (DataFrame readFromCsv: path) class equals: DataFrame
]

{ #category : 'as yet unclassified' }
DataFrameBenchmarkExamples >> removeAt [

	<script: ' self new removeAt'>
	| df |

	df := DataFrame withRows: { { 'a' . 1 } . { 'b' . 2 } . { 'c' . 3 } }.
	
	df removeRowAt: 1
]

{ #category : 'as yet unclassified' }
DataFrameBenchmarkExamples >> transposed [

	<script: ' self new transposed'>
	| df |

	df := DataFrame withRows: { { 'a' . 1 } . { 'b' . 2 } . { 'c' . 3 } }.
	
	self assert: df transposed equals: (DataFrame withRows: { { 'a' . 'b' . 'c' } . { 1 . 2 . 3 } }).
]

{ #category : 'as yet unclassified' }
DataFrameBenchmarkExamples >> withRows [

	<script: ' self new withRows'>
	| array |

	array := { { 'a' . 1 } . { 'b' . 2 } . { 'c' . 3 } }.
	
	self assert: (DataFrame withRows: array) class equals: DataFrame.
]
