"
|srv|
srv:= (ZnServer startOn: 8100)
	delegate: ((ZnServerGoogleSSODelegate  new
					googleData: (ZnOAuth2ConsumerData 
									key: 'XXXXX.apps.googleusercontent.com'
									secret: 'YYYYYYYYYYYYYYYYYY'		
									redirectUrl: 'http://localhost:8100/sso-google-callback');
									yourself) 
									addInitializationBlock: [:session| session beConsentPrompt;beOfflineAccessType. 
																				session scopes addAll: 
																					(OrderedCollection with:'https://www.googleapis.com/auth/calendar.readonly' with:'https://www.googleapis.com/auth/calendar')   ]) ;
									yourself.
srv

"
Class {
	#name : #ZnServerGoogleSSODelegate,
	#superclass : #ZnDefaultServerDelegate,
	#instVars : [
		'googleData',
		'initializationBlocks'
	],
	#category : #'GoogleAPIClient-IdentityAuthentication'
}

{ #category : #accessing }
ZnServerGoogleSSODelegate >> addInitializationBlock: aBlock [

	initializationBlocks add: aBlock
]

{ #category : #'accessing-session' }
ZnServerGoogleSSODelegate >> buildSession [

	| session |
	session := ZnOAuth2Session google: self googleData.
	initializationBlocks do: [ :each | each value: session ].
	session addDependent: self. 
	^ session
]

{ #category : #private }
ZnServerGoogleSSODelegate >> generateInvalidCallbackRequest [

	| html entity |

	html := String streamContents: [ :stream |
		stream
			nextPutAll: '<h3>Not a valid callback request</h3>' ].

	entity := ZnEntity html: html. 
	^ ZnResponse ok: entity
]

{ #category : #accessing }
ZnServerGoogleSSODelegate >> googleData [

	^ googleData
]

{ #category : #accessing }
ZnServerGoogleSSODelegate >> googleData: anObject [

	googleData := anObject
]

{ #category : #'accessing-session' }
ZnServerGoogleSSODelegate >> googleSessionFor: aRequest [

	^ aRequest session
		  attributeAt: 'google-session'
		  ifAbsentPut: [ self buildSession ]
]

{ #category : #private }
ZnServerGoogleSSODelegate >> htmlPageTitled: title do: block [
	^ String streamContents: [ :stream |
		stream 
			<< '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>';
			<< title;
			<< '</title>
<style type="text/css">
body {
  color: black;
  background: white;
  width: 900px;
  font-family: Verdana, Arial, Helvetica, sans-serif;
  font-size: 13px;
}
p {
  width: 600px;
  padding: 0 5px 10px 0px;
} 
ul,ol {
  width: 600px;
  padding: 0 5px 5px 30px;
} 
#logo {
  color: orange;
  font-family: Helvetica, sans-serif;
  font-weight: bold;
  font-size: 100px;
}
</style>
</head>
<body>
<div id="logo">Zn</div>
<h1>'; 
			<< title; 
			<<'</h1>'. 
		block value: stream. 
		stream << '</body></html>' ]
]

{ #category : #initialization }
ZnServerGoogleSSODelegate >> initialize [

	super initialize.

	self prefixMap
		at: 'sso-sheets-google' put: #ssoSheetsGoogle:;
		at: 'sso-google' put: #ssoGoogle:;
		at: 'sso-google-callback' put: #ssoGoogleCallback:;
		at: 'sso-google-data' put: #ssoGoogleData:.

	initializationBlocks := OrderedCollection new
]

{ #category : #testing }
ZnServerGoogleSSODelegate >> isOAuth2Callback: aRequest [

	^aRequest uri queryKeys includes: 'code'
]

{ #category : #printing }
ZnServerGoogleSSODelegate >> printDictionary: aDictionary asHtmlOn: aStream [

	aStream
		nextPutAll: '<ul>'.
	aDictionary keysAndValuesDo: [ :key :value |
		aStream
			nextPutAll: '<li>' ;
			nextPutAll: key.
		value isDictionary
			ifTrue: [ self printDictionary: value asHtmlOn: aStream ]
			ifFalse: [
				aStream
					nextPutAll: ' --> ' ;
					nextPutAll: value asString ].
		aStream nextPutAll: '</li>' ].
	aStream nextPutAll: '</ul>'
]

{ #category : #accessing }
ZnServerGoogleSSODelegate >> resetInitializationBlock [

	initializationBlocks := OrderedCollection new
]

{ #category : #responses }
ZnServerGoogleSSODelegate >> ssoGoogle: request [

	| googleSession html entity |
	
	googleSession := self googleSessionFor: request.
		
	html := self htmlPageTitled: 'Zinc SSO Google Login' do: [ :stream |
		stream
			<< '<h3>Google SSO</h3>' ;
			<< '<a href="' ;
			<< googleSession authenticationUrl asString ;
			<< '">Login with Google</a>' ].

	entity := ZnEntity html: html. 
	^ ZnResponse ok: entity
]

{ #category : #responses }
ZnServerGoogleSSODelegate >> ssoGoogleCallback: request [

	| googleSession |
	
	(self isOAuth2Callback: request)
		ifFalse: [ ^ self generateInvalidCallbackRequest ].

	googleSession := self googleSessionFor: request.
	googleSession handleAuthenticationCallback: request uri query.

	^ ZnResponse redirect: 'sso-google-data'
]

{ #category : #responses }
ZnServerGoogleSSODelegate >> ssoGoogleData: request [

	| googleSession userData html entity |
	
	googleSession := self googleSessionFor: request.
	userData := googleSession getUserData.

	html := self htmlPageTitled: 'Zinc SSO Google UserData' do: [ :stream | 
		stream << '<h3>Google UserData</h3>'.
		self printDictionary: userData asHtmlOn: stream.
		stream << '<a href="sso-reset">Reset</a>'  ].

	entity := ZnEntity html: html. 
	^ ZnResponse ok: entity
]

{ #category : #responses }
ZnServerGoogleSSODelegate >> ssoSheetsGoogle: request [

	| googleSession html entity |
	
	googleSession := self googleSessionFor: request.
		
	html := self htmlPageTitled: 'Zinc SSO Google Login' do: [ :stream |
		stream
			<< '<h3>Google SSO</h3>' ;
			<< '<a href="' ;
			<< googleSession authenticationUrl asString ;
			<< '">Login with Google</a>' ].

	entity := ZnEntity html: html. 
	^ ZnResponse ok: entity
]

{ #category : #updating }
ZnServerGoogleSSODelegate >> update: anAspect with: anObject [

	self addInitializationBlock: [ :session | 
		session
			refreshToken: anObject;
			liveAccessToken ]
]
