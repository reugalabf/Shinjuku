Extension { #name : #DateAndTime }

{ #category : #'*GoogleAPIClient' }
DateAndTime >> hhmmss [

	| ws |
	ws := WriteStream on: String new.
	self printHMSOn: ws.
	^ ws contents
]
