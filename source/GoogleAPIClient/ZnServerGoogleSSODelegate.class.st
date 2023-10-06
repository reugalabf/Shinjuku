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
ZnServerGoogleSSODelegate >> addInitializationBlock: aBlock forAPI: apiName [

	initializationBlocks
		at: apiName
		ifPresent: [ :col | col add: aBlock ]
		ifAbsentPut: [ OrderedCollection with: aBlock ]
]

{ #category : #'accessing-session' }
ZnServerGoogleSSODelegate >> apiOfRequest: aRequest [

	"^ aRequest relativeUrl lastPathSegment"
	
	^ (aRequest relativeUrl lastPathSegment substrings: #( $- )) last
]

{ #category : #'private - html' }
ZnServerGoogleSSODelegate >> authenticationSessionLinkFor: googleSession on: stream [

	^ stream
		  << '<h3>Google SSO</h3>';
		  << '<p>';
		  << '<a href="';
		  << googleSession authenticationUrl asString;
		  << '">Login with Google</a>';
		  << '</p>'
]

{ #category : #accessing }
ZnServerGoogleSSODelegate >> availableGoogleDataName [

	^ googleData keys
]

{ #category : #'private - html' }
ZnServerGoogleSSODelegate >> availableServiceLinksOn: stream [

	stream << '<h3>Google SSO</h3>'.
	^ self availableGoogleDataName do: [ :name | 
		  (stream << '<p>')
			  << '<a href="';
			  << ('sso-google-<1s>' expandMacrosWith: name);
			  << ('">Login with Google.<1s></a>' expandMacrosWith: name);
			  << '</p>' ]
]

{ #category : #'accessing-session' }
ZnServerGoogleSSODelegate >> buildSessionForApi: aString [

	| session gData |
	gData := self googleDataForApi: aString.
	gData ifNotNil: [ 
		session := ZnOAuth2Session google: gData.
		(initializationBlocks at: aString) do: [ :each | 
			each value: session ].
		session addDependent: self ].
	^ session
]

{ #category : #'private - html' }
ZnServerGoogleSSODelegate >> clientAuthenticationUrlForAPI: apiName port: aPort [

	^ 'http://localhost:<1s>/sso-google-<2s>'
		  expandMacrosWith: aPort printString
		  with: apiName
]

{ #category : #'private - html' }
ZnServerGoogleSSODelegate >> generateInvalidCallbackRequest [

	| html entity |
	html := String streamContents: [ :stream | 
		        stream
			        << '<h3>Not a valid callback request</h3>';
			        << '<p>';
			        << '<a href="';
			        << 'sso-google';
			        << '">Available Google Services</a>';
			        << '</p>' ].

	entity := ZnEntity html: html.
	^ ZnResponse ok: entity
]

{ #category : #'private - html' }
ZnServerGoogleSSODelegate >> generateInvalidRequest [

	| html entity |
	html := String streamContents: [ :stream | 
		        stream
			        << '<h3>Not a valid request</h3>';
			        << '<p>';
			        << '<a href="';
			        << 'sso-google';
			        << '">Available Google Services</a>';
			        << '</p>' ].

	entity := ZnEntity html: html.
	^ ZnResponse ok: entity
]

{ #category : #accessing }
ZnServerGoogleSSODelegate >> googleData: anObject forApi: aString [

	googleData at: aString put: anObject.
	self prefixMap at: (self localUrlForAPI: aString) put: #ssoGoogle:.
	self prefixMap
		at: (self localRedirectUrlForAPI: aString)
		put: #ssoGoogleCallback:.
	self prefixMap
		at: (self localDataUrlForApi: aString)
		put: #ssoGoogleData:
]

{ #category : #accessing }
ZnServerGoogleSSODelegate >> googleDataForApi: aString [

	^ googleData at: aString ifAbsent: [ nil ]
]

{ #category : #'accessing-session' }
ZnServerGoogleSSODelegate >> googleSessionFor: aRequest [

	| apiName sessionId |
	apiName := self apiOfRequest: aRequest.
	sessionId := self sessionIdForApi: apiName.

	^ aRequest session
		  attributeAt: sessionId
		  ifAbsentPut: [ 
		  self buildSessionForApi: apiName ]
]

{ #category : #'private - html' }
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
		at: 'sso-google' put: #ssoGoogle:;
		at: 'sso-google-callback' put: #ssoGoogleCallback:;
		at: 'sso-google-data' put: #ssoGoogleData:.
	googleData := Dictionary new.
	initializationBlocks := Dictionary new
]

{ #category : #testing }
ZnServerGoogleSSODelegate >> isOAuth2Callback: aRequest [

	^aRequest uri queryKeys includes: 'code'
]

{ #category : #responses }
ZnServerGoogleSSODelegate >> localDataUrlForApi: aString [

	^ 'sso-google-data-<1s>' expandMacrosWith: aString
]

{ #category : #initialization }
ZnServerGoogleSSODelegate >> localRedirectUrlForAPI: apiName [

	^ 'sso-google-callback-<1s>' expandMacrosWith: apiName
]

{ #category : #initialization }
ZnServerGoogleSSODelegate >> localUrlForAPI: apiName [

	^ 'sso-google-<1s>' expandMacrosWith: apiName
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

{ #category : #'accessing-session' }
ZnServerGoogleSSODelegate >> sessionIdForApi: apiName [

	^ '<1s>-session' expandMacrosWith: apiName
]

{ #category : #responses }
ZnServerGoogleSSODelegate >> ssoGoogle: request [

	| googleSession html entity |
	googleSession := self googleSessionFor: request.
	googleSession
		ifNil: [ 
			html := self
				        htmlPageTitled: 'Zinc SSO Google Login'
				        do: [ :stream | self availableServiceLinksOn: stream ] ]
		ifNotNil: [ 
			html := self
				        htmlPageTitled: 'Zinc SSO Google Login'
				        do: [ :stream | 
					        self
						        authenticationSessionLinkFor: googleSession
						        on: stream ] ].

	entity := ZnEntity html: html.
	^ ZnResponse ok: entity
]

{ #category : #responses }
ZnServerGoogleSSODelegate >> ssoGoogleCallback: request [

	| googleSession |
	(self isOAuth2Callback: request) ifFalse: [ 
		^ self generateInvalidCallbackRequest ].

	googleSession := self googleSessionFor: request.
	googleSession handleAuthenticationCallback: request uri query.

	^ ZnResponse redirect:
		  (self localDataUrlForApi: (self apiOfRequest: request))
]

{ #category : #responses }
ZnServerGoogleSSODelegate >> ssoGoogleData: request [

	| googleSession userData html entity |
	
	googleSession := self googleSessionFor: request.
	googleSession ifNil: [ ^ self generateInvalidRequest ].

	userData := googleSession getUserData.

	html := self
		        htmlPageTitled: 'Zinc SSO Google UserData'
		        do: [ :stream | self userDataPage: userData on: stream ].

	entity := ZnEntity html: html.
	^ ZnResponse ok: entity
]

{ #category : #updating }
ZnServerGoogleSSODelegate >> update: anAspect with: aSession [

	self
		addInitializationBlock: [ :session | 
			session liveAccessToken
			"refreshToken: apiTokenAssoc value;" ]
		forAPI: (aSession redirectUrl substrings: #( $- )) last
]

{ #category : #responses }
ZnServerGoogleSSODelegate >> userDataPage: userData on: stream [

	stream << '<h3>Google UserData</h3>'.
	self printDictionary: userData asHtmlOn: stream.
	^ stream << '<a href="sso-reset">Reset</a>'
]
