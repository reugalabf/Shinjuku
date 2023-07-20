"
It builds the authentication (OAuth2) infrastructure

GoogleAuthenticationServerFactory
port: '8100' 
key: '984973766290-6uf0t0ujs2a8erap02s9kh20ts1c69ge.apps.googleusercontent.com' 
secret: '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' 
redirectTo: 'http://localhost:8100/sso-google-callback' 
initializationBlocks: (OrderedCollection new:[:session| session beConsentPrompt;beOfflineAccessType. 
	session scopes addAll: (OrderedCollection with:'https://www.googleapis.com/auth/calendar.readonly' with:'https://www.googleapis.com/auth/calendar')])

"
Class {
	#name : #GoogleAuthenticationServerFactory,
	#superclass : #Object,
	#category : #'GoogleAPIClient-IdentityAuthentication'
}

{ #category : #private }
GoogleAuthenticationServerFactory class >> delegateKey: aKey secret: aSecret redirect: aUrl [

	^ ZnServerGoogleSSODelegate new
		  googleData:
			  (ZnOAuth2ConsumerData key: aKey secret: aSecret redirectUrl: aUrl);
		  yourself
]

{ #category : #private }
GoogleAuthenticationServerFactory class >> getServerOn: aPort [

	^ ZnServer defaultServerClass allInstances
		  detect: [ :each | each port = aPort and: [ each isListening ] ]
		  ifNone: [ ZnServer startOn: aPort ]
]

{ #category : #building }
GoogleAuthenticationServerFactory class >> port: aPort key: aKey secret: aSecret redirectTo: aUrl initializationBlocks: initBlocks [

	| srv delegate response |
	delegate := self delegateKey: aKey secret: aSecret redirect: aUrl.
	initBlocks do: [ :aBlock | delegate addInitializationBlock: aBlock ].


	srv := (self getServerOn: aPort)
		       delegate: delegate;
		       yourself.

	(srv hasSessionForKey: 'google-session') ifFalse: [ 
		response := ZnEasy get:
			            ('http://localhost:<1s>/sso-google' expandMacrosWith:
				             aPort printString) ].

	^ srv
]

{ #category : #building }
GoogleAuthenticationServerFactory class >> port: aPort key: aKey secret: aSecret redirectTo: aUrl initializationBlocks: initBlocks scopes: aCollection [

	| srv delegate response |
	delegate := self delegateKey: aKey secret: aSecret redirect: aUrl.
	initBlocks do: [ :aBlock | delegate addInitializationBlock: aBlock ].


	srv := (self getServerOn: aPort)
		       delegate: delegate;
		       yourself.

	(srv hasSessionForKey: 'google-session' scopes: aCollection) 
		ifFalse: [ 
			response := ZnEasy get:
				            ('http://localhost:<1s>/sso-google' expandMacrosWith:
					             aPort printString) ].

	^ srv
]
