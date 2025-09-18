Class {
	#name : 'DRConstraintSolverBenchmarkExamples',
	#superclass : 'TestCase',
	#category : 'PBA-Libraries usages',
	#package : 'PBA',
	#tag : 'Libraries usages'
}

{ #category : 'testing' }
DRConstraintSolverBenchmarkExamples >> includes [

	<script: ' self new includes'>
	| c1 c2 |
	
	c1 := (DRLessOrEqualsConstraint withValue: 11) intersectionWith: (DRGreaterConstraint withValue: 9).

	c2 := DREqualsConstraint withValue: 10.

	self assert: (c1 includes: c2) equals: true
]
