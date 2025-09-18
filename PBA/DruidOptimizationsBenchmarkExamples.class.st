Class {
	#name : 'DruidOptimizationsBenchmarkExamples',
	#superclass : 'TestCase',
	#category : 'PBA-Libraries usages',
	#package : 'PBA',
	#tag : 'Libraries usages'
}

{ #category : 'as yet unclassified' }
DruidOptimizationsBenchmarkExamples >> applyOptimization [

	<script: 'self new applyOptimization'>
	| cfg copied |
	
	cfg := (DRIRParser for: '[[b0]]
b_i:
    len := Copy(5)
    i0 := Copy(0)
    _ := Jump(b_while)
b_while:[b_i, b_access]
    i1 := Ø(i0, i2)
    _ := If(LessThan, i1, len; b_access, b_error)

b_access:
    x := LoadFramePointer()
    i2 := Add(i1, 1)
    _ := If(LessThan, i2, len; b_while, b_end)

b_end:
    _ := Store(8, 2, 777)
b_error:
    _ := Store(8, 2, 999)

b0:
    _ := Jump(b_i)
') parse.

	copied := cfg copy.

	self deny: (cfg applyOptimisation: DRDeadBlockElimination) equals: copied
]
