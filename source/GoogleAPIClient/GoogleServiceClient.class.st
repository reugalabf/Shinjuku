Class {
	#name : #GoogleServiceClient,
	#superclass : #Object,
	#instVars : [
		'authenticationServer'
	],
	#category : #'GoogleAPIClient-Client'
}

{ #category : #initialization }
GoogleServiceClient >> authenticationPort [

	^ self subclassResponsibility
]

{ #category : #initialization }
GoogleServiceClient >> buildAuthenticationServer [

	^ GoogleAuthenticationServerBuilder
		  port: self authenticationPort
		  key: self serviceKey
		  secret: self serviceSecret
		  redirectTo: self redirectUrl
		  initializationBlocks: self initBlocks
]

{ #category : #initialization }
GoogleServiceClient >> initBlocks [

	^ self subclassResponsibility
]

{ #category : #initialization }
GoogleServiceClient >> initialize [

	super initialize.
	authenticationServer := self buildAuthenticationServer.
	^ self
]

{ #category : #initialization }
GoogleServiceClient >> redirectUrl [

	^ self subclassResponsibility
]

{ #category : #initialization }
GoogleServiceClient >> serviceKey [

	^ self subclassResponsibility
]

{ #category : #initialization }
GoogleServiceClient >> serviceSecret [

	^ self subclassResponsibility
]
