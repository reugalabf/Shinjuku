"
This is a builder that takes the downloaded json from the google console and instantiate the identification (SSO) local server.
It will configure the delegate with the post initialization blocks and the refreshToken

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

	"	
|srv|
srv:= (ZnServer startOn: 8100)
delegate: ((ZnServerGoogleSSODelegate  new
googleData: (ZnOAuth2ConsumerData
key: '984973766290-6uf0t0ujs2a8erap02s9kh20ts1c69ge.apps.googleusercontent.com'
secret: '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'
redirectUrl: 'http://localhost:8100/sso-google-callback');
yourself) 
addInitializationBlock: [:session| session beConsentPrompt;beOfflineAccessType. 
	session scopes addAll: (OrderedCollection with:'https://www.googleapis.com/auth/calendar.readonly' with:'https://www.googleapis.com/auth/calendar')   ]) ;
yourself.
srv."

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
