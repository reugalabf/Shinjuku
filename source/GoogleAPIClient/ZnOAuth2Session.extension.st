Extension { #name : #ZnOAuth2Session }

{ #category : #'*GoogleAPIClient' }
ZnOAuth2Session >> canHandleScopes: aCollection [

	^ scopes includesAll: aCollection
]
