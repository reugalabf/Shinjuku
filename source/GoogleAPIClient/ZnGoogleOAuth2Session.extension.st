Extension { #name : #ZnGoogleOAuth2Session }

{ #category : #'*GoogleAPIClient' }
ZnGoogleOAuth2Session >> handleAuthenticationCallback: aParameterDictionary [

	| oldtoken |
	oldtoken := self refreshToken.
	super handleAuthenticationCallback: aParameterDictionary.
	((oldtoken = self refreshToken) not and: [ self refreshToken notNil ]) 
		ifTrue: [ self changed: #refreshToken with: self refreshToken ]
]

{ #category : #'*GoogleAPIClient' }
ZnGoogleOAuth2Session >> retrieveFrom:readStream [
"Store user data and refreshToken on json format"
]

{ #category : #'*GoogleAPIClient' }
ZnGoogleOAuth2Session >> storeOn:writeStream [
"Store user data and refreshToken on json format"
]
