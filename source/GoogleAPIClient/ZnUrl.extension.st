Extension { #name : #ZnUrl }

{ #category : #'*GoogleAPIClient' }
ZnUrl >> query [

	^ query isNil
		  ifTrue: [ query := Dictionary new ]
		  ifFalse: [ query ]
]
