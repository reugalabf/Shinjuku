"
settings JSON format 

#port: Number
#host: String
#key: String
#secret: String
#apiName:String

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
" json structure
host
keymapNamed: 
secret
port
apiName
"


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
"host
keymapNamed: 
secret
port
apiName"

	^ super new
		  initializeSettings: aDictionary;
		  yourself
]

{ #category : #accessing }
GoogleServiceClient >> apiName [

	^ settings at: #apiName
]

{ #category : #initialization }
GoogleServiceClient >> authenticationPort [

	^ settings at: #port
]

{ #category : #initialization }
GoogleServiceClient >> buildAuthenticationServerForAPI:apiName [

	^ GoogleAuthenticationServerFactory
		  port: self authenticationPort
		  key: self serviceKey
		  secret: self serviceSecret
		  redirectTo: self redirectUrl
		  initializationBlocks: self initBlocks
		  scopes: self requiredScopes
		  apiName: apiName
]

{ #category : #testing }
GoogleServiceClient >> canCallAPI [

	"	^ authenticationServer isRunning and: [ 
		  (authenticationServer hasSessionForKey: 'google-session' scopes: self requiredScopes) and: [ 
			  (authenticationServer sessionManager sessionForKey:
				   'google-session' scopes: self requiredScopes ) isLive ] ]"

	| session |
	^ authenticationServer isRunning and: [ 
		  (session := authenticationServer sessionManager
			              sessionForKey: 'google-session'
			              scopes: self requiredScopes) notNil and: [ 
			  session isLive ] ]
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
		 (aDictionary includesKey: #host) and: [ 
			 (aDictionary includesKey: #key) and: [ 
				 (aDictionary includesKey: #secret) and: [ 
				 aDictionary includesKey: #apiName ] ] ] ])
		ifTrue: [ settings := aDictionary ]
		ifFalse: [ self error: 'Incomplete settings' ].

	authenticationServer := self buildAuthenticationServerForAPI: self apiName
]

{ #category : #initialization }
GoogleServiceClient >> redirectUrl [

	^ '<1s>:<2s>/sso-google-callback/<3s>'
		  expandMacrosWith: (settings at: #host)
		  with: (settings at: #port)printString
		  with: (settings at: #apiName)
]

{ #category : #initialization }
GoogleServiceClient >> requiredScopes [

	^ self subclassResponsibility
]

{ #category : #initialization }
GoogleServiceClient >> serviceKey [

	^ settings at: #key
]

{ #category : #initialization }
GoogleServiceClient >> serviceSecret [

	^ settings at: #secret
]
