Extension { #name : #Duration }

{ #category : #'*GoogleAPIClient' }
Duration >> hhmm [

	| aStream h m |
	aStream := WriteStream on: String new.

	"Format as per ANSI 5.8.2.16: [-]D:HH:MM:SS[.S]"

	h := self hours abs.
	m := self minutes abs.
	self negative
		ifTrue: [ aStream nextPut: $- ]
		ifFalse: [ aStream nextPut: $+ ].


	h < 10 ifTrue: [ aStream nextPut: $0 ].
	h printOn: aStream.
	aStream nextPut: $:.
	m < 10 ifTrue: [ aStream nextPut: $0 ].
	m printOn: aStream.
	^ aStream contents
]
