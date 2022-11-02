"
It builds the authentication (OAuth2) infrastructure

GoogleAuthenticationServerBuilder 
port: '8100' 
key: '984973766290-6uf0t0ujs2a8erap02s9kh20ts1c69ge.apps.googleusercontent.com' 
secret: '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' 
redirectTo: 'http://localhost:8100/sso-google-callback' 
initializationBlocks: (OrderedCollection new:[:session| session beConsentPrompt;beOfflineAccessType. 
	session scopes addAll: (OrderedCollection with:'https://www.googleapis.com/auth/calendar.readonly' with:'https://www.googleapis.com/auth/calendar')])

"
Class {
	#name : #GoogleAuthenticationServerBuilder,
	#superclass : #Object,
	#category : #'GoogleAPIClient-IdentityAuthentication'
}

{ #category : #private }
GoogleAuthenticationServerBuilder class >> delegateKey: aKey secret: aSecret redirect: aUrl [

	^ ZnServerGoogleSSODelegate new
		  googleData:
			  (ZnOAuth2ConsumerData key: aKey secret: aSecret redirectUrl: aUrl);
		  yourself
]

{ #category : #building }
GoogleAuthenticationServerBuilder class >> port: aPort key: aKey secret: aSecret redirectTo: aUrl initializationBlocks: initBlocks [

	| srv delegate |
	delegate := self delegateKey: aKey secret: aSecret redirect: aUrl.
	initBlocks do: [ :aBlock | delegate addInitializationBlock: aBlock ].


	srv := (ZnServer startOn: aPort)
		       delegate: delegate;
		       yourself.
	ZnEasy get:
		('http://localhost:<1s>/sso-google' expandMacrosWith: aPort).
	srv
]