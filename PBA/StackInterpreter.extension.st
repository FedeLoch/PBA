Extension { #name : 'StackInterpreter' }

{ #category : '*PBA' }
StackInterpreter >> booleanCheatFalse [

	"cheat the interpreter out of the pleasure of handling the next bytecode IFF it is a jump-on-boolean. Which it is, often enough when the current bytecode is something like bytecodePrimEqual"

	<sharedCodeInCase: #bytecodePrimGreaterThan>
	| bytecode offset |
	bytecode := self fetchByte. "assume next bytecode is jumpIfFalse (99%)"
	self pop: 2.
	(bytecode < 160 and: [ bytecode > 151 ]) ifTrue: [ "short jumpIfFalse" 
		^ self jump: bytecode - 151 ].

	bytecode = 172 ifTrue: [ "long jumpIfFalse"
		offset := self fetchByte.
		^ self jump: offset ].

	"not followed by a jumpIfFalse; (un)do instruction fetch and push boolean result"
	self currentBytecode: bytecode.
	self push: objectMemory falseObject
]

{ #category : '*PBA' }
StackInterpreter >> booleanCheatFalseSistaV1 [

	"cheat the interpreter out of the pleasure of handling the next bytecode IFF it is a jump-on-boolean. Which it is, often enough when the current bytecode is something like bytecodePrimEqual"

	<sharedCodeInCase: #bytecodePrimGreaterThanSistaV1>
	| bytecode offset |
	bytecode := self fetchByte. "assume next bytecode is jumpIfFalse (99%)"
	self pop: 2.
	(bytecode < 199 and: [ bytecode > 191 ]) ifTrue: [ "short jumpIfFalse" 
		^ self jump: bytecode - 191 ].

	bytecode = 239 ifTrue: [ "long jumpIfFalse"
		offset := self fetchByte.
		^ self jump: offset ].

	"not followed by a jumpIfFalse; (un)do instruction fetch and push boolean result"
	self currentBytecode: bytecode.
	self push: objectMemory falseObject
]

{ #category : '*PBA' }
StackInterpreter >> booleanCheatFalseV4 [

	"cheat the interpreter out of the pleasure of handling the next bytecode IFF it is a jump-on-boolean. Which it is, often enough when the current bytecode is something like bytecodePrimEqual"

	<sharedCodeInCase: #bytecodePrimGreaterThanV4>
	| bytecode offset |
	bytecode := self fetchByte. "assume next bytecode is jumpIfFalse (99%)"
	self pop: 2.
	(bytecode < 216 and: [ bytecode > 207 ]) ifTrue: [ "short jumpIfFalse" 
		^ self jump: bytecode - 207 ].

	bytecode = 244 ifTrue: [ "long jumpIfFalse"
		offset := self fetchByte.
		^ self jump: offset ].

	"not followed by a jumpIfFalse; (un)do instruction fetch and push boolean result"
	self currentBytecode: bytecode.
	self push: objectMemory falseObject
]

{ #category : '*PBA' }
StackInterpreter >> booleanCheatTrue [

	"cheat the interpreter out of the pleasure of handling the next bytecode IFF it is a jump-on-boolean. Which it is, often enough when the current bytecode is something like bytecodePrimEqual"

	<sharedCodeInCase: #bytecodePrimLessThan>
	| bytecode offset |
	bytecode := self fetchByte. "assume next bytecode is jumpIfFalse (99%)"
	self pop: 2.
	(bytecode < 173 and: [ bytecode > 151 ]) ifTrue: [ 
		bytecode < 160 ifTrue: [ "short jumpIfFalse 152 - 159" 
			^ self fetchNextBytecode ].
		bytecode = 172 ifTrue: [ "long jumpIfFalse"
			self fetchByte.
			^ self fetchNextBytecode ].
		bytecode > 167 ifTrue: [ "long jumpIfTrue 168 - 171"
			offset := bytecode - 168 << 8 + self fetchByte.
			^ self jump: offset ] ].

	"not followed by a jumpIfFalse; (un)do instruction fetch and push boolean result"
	self currentBytecode: bytecode.
	self push: objectMemory trueObject
]

{ #category : '*PBA' }
StackInterpreter >> booleanCheatTrueSistaV1 [

	"cheat the interpreter out of the pleasure of handling the next bytecode IFF it is a jump-on-boolean. Which it is, often enough when the current bytecode is something like bytecodePrimEqual"

	<sharedCodeInCase: #bytecodePrimLessThanSistaV1>
	| bytecode offset |
	bytecode := self fetchByte. "assume next bytecode is jumpIfFalse (99%)"
	self pop: 2.
	bytecode >= 192 ifTrue: [ 
		bytecode <= 199 ifTrue: [ "short jumpIfFalse 192 - 199" 
			^ self fetchNextBytecode ].
		bytecode = 239 ifTrue: [ "long jumpIfFalse"
			self fetchByte.
			^ self fetchNextBytecode ].
		bytecode = 238 ifTrue: [ "long jumpIfTrue 238"
			offset := self fetchByte.
			^ self jump: offset ] ].

	"not followed by a jumpIfFalse; (un)do instruction fetch and push boolean result"
	self currentBytecode: bytecode.
	self push: objectMemory trueObject
]

{ #category : '*PBA' }
StackInterpreter >> booleanCheatTrueV4 [

	"cheat the interpreter out of the pleasure of handling the next bytecode IFF it is a jump-on-boolean. Which it is, often enough when the current bytecode is something like bytecodePrimEqual"

	<sharedCodeInCase: #bytecodePrimLessThanV4>
	| bytecode offset |
	bytecode := self fetchByte. "assume next bytecode is jumpIfFalse (99%)"
	self pop: 2.
	bytecode >= 208 ifTrue: [ 
		bytecode <= 215 ifTrue: [ "short jumpIfFalse 208 - 215" 
			^ self fetchNextBytecode ].
		bytecode = 244 ifTrue: [ "long jumpIfFalse"
			self fetchByte.
			^ self fetchNextBytecode ].
		bytecode = 243 ifTrue: [ "long jumpIfTrue 243"
			offset := self fetchByte.
			^ self jump: offset ] ].

	"not followed by a jumpIfFalse; (un)do instruction fetch and push boolean result"
	self currentBytecode: bytecode.
	self push: objectMemory trueObject
]

{ #category : '*PBA' }
StackInterpreter >> fetchNextBytecode [

	"This method fetches the next instruction (bytecode). Each bytecode method is responsible for fetching the next bytecode, preferably as early as possible to allow the memory system time to process the request before the next dispatch."

	self currentBytecode: self fetchByte
]

{ #category : '*PBA' }
StackInterpreter >> jump: offset [

	instructionPointer := instructionPointer + offset + 1.
	self currentBytecode: (objectMemory byteAtPointer: instructionPointer)
]
