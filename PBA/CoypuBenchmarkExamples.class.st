Class {
	#name : 'CoypuBenchmarkExamples',
	#superclass : 'TestCase',
	#category : 'PBA-Libraries usages',
	#package : 'PBA',
	#tag : 'Libraries usages'
}

{ #category : 'accessing' }
CoypuBenchmarkExamples >> dirtNotes [

	<script: 'self new dirtNotes'>
	| notes |
	
	notes := '0 * 4 , 3 , 3 * 4 , 5 , 5 * 4 , 6 , 6 * 4 , 5'.
	
	(1 to: 100) atRandom semiquavers dirtNotes: notes; to: #superreese.
]

{ #category : 'accessing' }
CoypuBenchmarkExamples >> play [

	<script: 'self new play'>
	| perf freq |
	
	perf := PerformerSuperDirt new.
	freq := (1 to: 100) atRandom bpm.
	
	Performance uniqueInstance performer: perf; freq: freq; play
]

{ #category : 'accessing' }
CoypuBenchmarkExamples >> playFor [

	<script: 'self new playFor'>
	| perf seq freq |
	
	perf := PerformerSuperDirt new.
	seq := (1 to: 100) atRandom bars.
	freq := (1 to: 100) atRandom bpm.
	
	Performance uniqueInstance performer: perf; freq: freq; playFor: seq
]
