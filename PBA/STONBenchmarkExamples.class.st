Class {
	#name : 'STONBenchmarkExamples',
	#superclass : 'TestCase',
	#category : 'PBA-Libraries usages',
	#package : 'PBA',
	#tag : 'Libraries usages'
}

{ #category : 'as yet unclassified' }
STONBenchmarkExamples >> fromString [

	<script: ' self new fromString'>
	| str |
	str := 'Rectangle{#origin:Point[0,0],#corner:Point[1440,846]}'.
	
	self assert: (STON toString: (STON fromString: str)) equals: str.
]

{ #category : 'as yet unclassified' }
STONBenchmarkExamples >> toString [

	<script: ' self new toString'>
	| obj |
	obj := Rectangle new setPoint: 0@0 point: 1440@846.
	
	self assert: (STON fromString: (STON toString: obj)) equals: obj.
]
