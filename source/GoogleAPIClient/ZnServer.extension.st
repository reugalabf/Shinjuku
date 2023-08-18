Extension { #name : #ZnServer }

{ #category : #'*GoogleAPIClient' }
ZnServer >> hasDelegate [

	self optionAt: #delegate ifAbsent: [ ^ false ].
	^ true
]

{ #category : #'*GoogleAPIClient' }
ZnServer >> hasSessionForKey: aString [

	^ self sessionManager hasSessionForKey: aString
]

{ #category : #'*GoogleAPIClient' }
ZnServer >> hasSessionForKey: aString scopes: aCollection [

	^ self sessionManager hasSessionForKey: aString
]

{ #category : #'*GoogleAPIClient' }
ZnServer >> sessionForKey: aString [

	^ self sessionManager sessionForKey: aString
]

{ #category : #'*GoogleAPIClient' }
ZnServer >> sessionForKey: aString scopes: aCollection [

	^ self sessionManager sessionForKey: aString
]
