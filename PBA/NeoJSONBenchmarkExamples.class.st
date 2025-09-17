Class {
	#name : 'NeoJSONBenchmarkExamples',
	#superclass : 'TestCase',
	#category : 'PBA-Libraries usages',
	#package : 'PBA',
	#tag : 'Libraries usages'
}

{ #category : 'as yet unclassified' }
NeoJSONBenchmarkExamples >> fromString [

	<script: ' self new fromString'>
	| str |
	str := '{"origin":{"x":0,"y":0},"corner":{"x":1440,"y":846}}'.
	
	self assert: (NeoJSONWriter toString: (NeoJSONReader fromString: str)) equals: str

]

{ #category : 'as yet unclassified' }
NeoJSONBenchmarkExamples >> toString [

	<script: ' self new toString'>
	| obj |
	obj := Dictionary new
		at: 'origin' put: (Dictionary new at: 'x' put: 0; at: 'y' put: 0);
		at: 'corner' put: (Dictionary new at: 'x' put: 1440; at: 'y' put: 846).
	
	self assert: (NeoJSONReader fromString: (NeoJSONWriter toString: obj)) equals: obj

]
