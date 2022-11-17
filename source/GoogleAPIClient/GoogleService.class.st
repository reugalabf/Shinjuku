"
This is an abstract class that is the superclass of all GoogleServices brokers. They implement calls to google api and return a json
"
Class {
	#name : #GoogleService,
	#superclass : #Object,
	#instVars : [
		'sessionManager'
	],
	#category : #'GoogleAPIClient-ServiceBroker'
}

{ #category : #'instance creation' }
GoogleService class >> withSessionManager: aSession [

	^ self new
		  sessionManager: aSession;
		  yourself
]

{ #category : #'token management' }
GoogleService >> createNewSession [

	self createNewSessionWithRetry: 3.
	^ sessionManager sessionForKey: 'google-session'
]

{ #category : #'token management' }
GoogleService >> createNewSessionWithRetry: aNumber [

	aNumber = 0 ifTrue: [ 
		self error: 'Unable to create a session to Google Identity service' ].

	ZnEasy get: 'http://localhost:8100/sso-google'.
	(sessionManager hasSessionForKey: 'google-session') ifFalse: [ 
		self createNewSessionWithRetry: aNumber - 1 ]
]

{ #category : #'http request' }
GoogleService >> deleteRequestForURL: requestUrl [

	"GET https://www.googleapis.com/calendar/v3/users/me/calendarList/calendarId"

	"calendarId is a String"

	| client |
	client := ZnClient new.
	client delete: requestUrl.
	client request headers
		at: 'Authorization'
		put: 'Bearer ' , self liveAccessToken.
	client request headers at: 'Accept' put: 'application/json'.
	"client request writeToTranscript."
	^ client execute
]

{ #category : #'http request' }
GoogleService >> getRequestForURL: requestUrl [

	"GET https://www.googleapis.com/calendar/v3/users/me/calendarList/calendarId"

	"calendarId is a String"

	| client |
	client := ZnClient new.
	client get: requestUrl.
	client request headers
		at: 'Authorization'
		put: 'Bearer ' , self liveAccessToken.
	client request headers at: 'Accept' put: 'application/json'.
	"client request writeToTranscript."
	^ client execute
]

{ #category : #'token management' }
GoogleService >> liveAccessToken [

	| liveSession |
	liveSession := (sessionManager sessionForKey: 'google-session') 
		               ifNil: [ self createNewSession ].

	^ liveSession liveAccessToken
]

{ #category : #'http request' }
GoogleService >> postRequestForURL: requestUrl [

	"GET https://www.googleapis.com/calendar/v3/users/me/calendarList/calendarId"

	"calendarId is a String"
self halt
]

{ #category : #'http request' }
GoogleService >> postRequestForURL: requestUrl contents: aCollection [

	"GET https://www.googleapis.com/calendar/v3/users/me/calendarList/calendarId"

	"calendarId is a String"

	| client result |
	client := ZnClient new.


	client request headers
		at: 'Authorization'
		put: 'Bearer ' , self liveAccessToken.
	client request headers at: 'Accept' put: 'application/json'.
	client request headers at: 	'Content-Type' put:'application/json'.
self halt.

	result := client post: requestUrl contents: aCollection.
	client request writeToTranscript.
	^ result
]

{ #category : #'http request' }
GoogleService >> putRequestForURL: requestUrl [

	"GET https://www.googleapis.com/calendar/v3/users/me/calendarList/calendarId"

	"calendarId is a String"

	| client |
	client := ZnClient new.
	client put: requestUrl.
	client request headers
		at: 'Authorization'
		put: 'Bearer ' , self liveAccessToken.
	client request headers at: 'Accept' put: 'application/json'.
	"client request writeToTranscript."
	^ client execute
]

{ #category : #accessing }
GoogleService >> sessionManager [

	^ sessionManager
]

{ #category : #accessing }
GoogleService >> sessionManager: anObject [

	sessionManager := anObject
]
