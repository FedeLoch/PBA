Class {
	#name : 'DataSeriesBenchmarkExamples',
	#superclass : 'TestCase',
	#category : 'PBA-Libraries usages',
	#package : 'PBA',
	#tag : 'Libraries usages'
}

{ #category : 'as yet unclassified' }
DataSeriesBenchmarkExamples >> op1 [

	<script: ' self new op1'>
	| keys values ds |
	
	keys :=  { 'a' . 'b' . 'c' }.
	values := { 1 . 2 . 3 }.
	ds := DataSeries withKeys: keys values: values.
	
	self assert: ds sum equals: 6
]

{ #category : 'as yet unclassified' }
DataSeriesBenchmarkExamples >> op2 [

	<script: ' self new op2'>
	| keys values ds |
	
	keys :=  { 'a' . 'b' . 'c' }.
	values := { 1 . 2 . 3 }.
	ds := DataSeries withKeys: keys values: values.
	
	self assert: ds max equals: 3
]

{ #category : 'as yet unclassified' }
DataSeriesBenchmarkExamples >> withKeysValues [

	<script: ' self new withKeysValues'>
	| keys values |

	keys :=  { 'a' . 'b' . 'c' }.
	values := { 1 . 2 . 3 }.
	
	self assert: (DataSeries withKeys: keys values: values) class equals: DataSeries.
]

{ #category : 'as yet unclassified' }
DataSeriesBenchmarkExamples >> withValues [

	<script: ' self new withValues'>
	| values |
	values := { 1 . 2 . 3 }.
	
	self assert: (DataSeries withValues: values) class equals: DataSeries
]
