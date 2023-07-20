Extension { #name : #ZnServerSession }

{ #category : #'*GoogleAPIClient' }
ZnServerSession >> hasSessionForKey: aString [

	^ (self attributeKeys includes: aString) and: [ 
		  (self attributeAt: aString) isLive ]
]

{ #category : #'*GoogleAPIClient' }
ZnServerSession >> hasSessionForKey: aString scopes: aCollection [

	^ (self attributeKeys includes: aString) and: [ 
		  | oauthSession |
		  ((oauthSession := self attributeAt: aString) canHandleScopes:
			   aCollection) and: [ oauthSession isLive ] ]
]
