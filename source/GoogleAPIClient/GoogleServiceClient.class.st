"
settings JSON format 

#port: String
#url: String
#key: String
#secret: String

"
Class {
	#name : #GoogleServiceClient,
	#superclass : #Object,
	#instVars : [
		'authenticationServer',
		'settings'
	],
	#category : #'GoogleAPIClient-Client'
}

{ #category : #'instance creation' }
GoogleServiceClient class >> fromJson: aFilePathString [

	^ self withSettings:
		  (NeoJSONReader on: aFilePathString asFileReference readStream)
			  next
]

{ #category : #'instance creation' }
GoogleServiceClient class >> new [

	^ self shouldNotImplement
]

{ #category : #'instance creation' }
GoogleServiceClient class >> withSettings: aDictionary [

	^ super new
		  initializeSettings: aDictionary;
		  yourself
]

{ #category : #initialization }
GoogleServiceClient >> authenticationPort [

	^ settings at: #port
]

{ #category : #initialization }
GoogleServiceClient >> buildAuthenticationServer [

	^ GoogleAuthenticationServerFactory
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
	
	^ self
]

{ #category : #accessing }
GoogleServiceClient >> initializeSettings: aDictionary [

	((aDictionary includesKey: #port) and: [ 
		 (aDictionary includesKey: #url) and: [ 
			 (aDictionary includesKey: #key) and: [ 
				 aDictionary includesKey: #secret ] ] ])
		ifTrue: [ settings := aDictionary ]
		ifFalse: [ self error: 'Incomplete settings' ].

	authenticationServer := self buildAuthenticationServer
]

{ #category : #initialization }
GoogleServiceClient >> redirectUrl [

	^ settings at: #url
]

{ #category : #initialization }
GoogleServiceClient >> serviceKey [

	^ settings at: #key
]

{ #category : #initialization }
GoogleServiceClient >> serviceSecret [

	^ settings at: #secret
]
