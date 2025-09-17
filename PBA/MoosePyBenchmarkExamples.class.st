Class {
	#name : 'MoosePyBenchmarkExamples',
	#superclass : 'TestCase',
	#category : 'PBA-Libraries usages',
	#package : 'PBA',
	#tag : 'Libraries usages'
}

{ #category : 'as yet unclassified' }
MoosePyBenchmarkExamples >> loadPythonFile [

	<script: ' self new loadPythonFile'>
	| path |
	path := '/Users/fede/Documents/advent_of_code_2024/challenges/Day 11: Plutonian Pebbles/solve.py'.
	
	FamixPythonImporter import: path asFileReference
]
