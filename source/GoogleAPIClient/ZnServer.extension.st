Extension { #name : #ZnServer }

{ #category : #'*GoogleAPIClient' }
ZnServer >> hasSessionForKey: aString [

	^ self sessionManager hasSessionForKey: aString
]

{ #category : #'*GoogleAPIClient' }
ZnServer >> sessionForKey: aString [

	^ self sessionManager sessionForKey: aString
]
