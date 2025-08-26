Extension { #name : 'SMarkSlopstone' }

{ #category : '*PBA' }
SMarkSlopstone >> run [
	
	self runner: SMarkRunner new.
	runner suite: self.
	^ super run.
]
