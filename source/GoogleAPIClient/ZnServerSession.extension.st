Extension { #name : #ZnServerSession }

{ #category : #'*GoogleAPIClient' }
ZnServerSession >> hasSessionForKey: aString [

	^ (self attributeKeys includes: aString) and: [ 
		  (self attributeAt: aString) isLive ]
]
