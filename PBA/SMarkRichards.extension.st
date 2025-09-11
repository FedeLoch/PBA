Extension { #name : 'SMarkRichards' }

{ #category : '*PBA' }
SMarkRichards >> benchRichards: size [

	size timesRepeat: [
		RichObject initialize.
		RichRunner start
	]
]

{ #category : '*PBA' }
SMarkRichards >> run [

	^ self benchRichards
]

{ #category : '*PBA' }
SMarkRichards >> runWith: problemSize [

	^ self benchRichards: problemSize
]
