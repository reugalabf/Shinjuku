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
ZnGoogleOAuth2Session >> retrieveFrom: readStream [

	"retrieves user data and refreshToken on json format"

	| dataDict |
	dataDict := (NeoJSONReader on: readStream) next.
	((dataDict at: #key) = consumerData key and: [ 
		 (dataDict at: #secret) = consumerData secret ]) ifFalse: [ ^ self ].

	(dataDict at: #refreshToken) ifNotNil: [ :obj | 
		refreshToken := obj.
		self liveAccessToken ]
]

{ #category : #'*GoogleAPIClient' }
ZnGoogleOAuth2Session >> setConsumerData: aConsumerData [

	| fileRef |
	super setConsumerData: aConsumerData.
	(fileRef := self storeFileName)
		exists ifTrue: [ self retrieveFrom: fileRef readStream ]
]

{ #category : #'*GoogleAPIClient' }
ZnGoogleOAuth2Session >> storeFileName [

	^ (consumerData key , '-google.json') asFileReference
]

{ #category : #'*GoogleAPIClient' }
ZnGoogleOAuth2Session >> storeOn: writeStream [

	"Store user data and refreshToken on json format"

	| dataDict |
	dataDict := Dictionary new.
	dataDict at: #refreshToken put: refreshToken.
	dataDict at: #key put: consumerData key.
	dataDict at: #secret put: consumerData secret.
	writeStream nextPutAll: (NeoJSONWriter toString: dataDict).
	writeStream close
]

{ #category : #'*GoogleAPIClient' }
ZnGoogleOAuth2Session >> updateTokens: tokenData [

	[ super updateTokens: tokenData ]
		on: ZnAuthError
		do: [ :ex | 
			refreshToken := nil.
			self storeOn: self storeFileName writeStream.
			ex signal ].


	(refreshToken notNil and: [ self storeFileName exists not ]) ifTrue: [ 
		self storeOn: self storeFileName writeStream ]
]
