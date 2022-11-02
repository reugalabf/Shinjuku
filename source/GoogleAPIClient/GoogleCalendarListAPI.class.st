Class {
	#name : #GoogleCalendarListAPI,
	#superclass : #GoogleService,
	#category : #'GoogleAPIClient-ServiceBroker'
}

{ #category : #'service api' }
GoogleCalendarListAPI >> delete: calendarId [

	"DELETE https://www.googleapis.com/calendar/v3/users/me/calendarList/calendarId"

	^ self deleteRequestForURL:
		  'https://www.googleapis.com/calendar/v3/users/me/calendarList/calendarId'
		  , calendarId
]

{ #category : #'service api' }
GoogleCalendarListAPI >> get: calendarId [

	"GET https://www.googleapis.com/calendar/v3/users/me/calendarList/calendarId"

	"calendarId is a String"

	^ self getRequestForURL:
		  'https://www.googleapis.com/calendar/v3/users/me/calendarList'
		  , calendarId
]

{ #category : #'service api' }
GoogleCalendarListAPI >> insert [

	"POST https://www.googleapis.com/calendar/v3/users/me/calendarList"

	^ self postRequestForURL:
		  'https://www.googleapis.com/calendar/v3/users/me/calendarList'
]

{ #category : #'service api' }
GoogleCalendarListAPI >> list [

	^ self getRequestForURL:
		  'https://www.googleapis.com/calendar/v3/users/me/calendarList'
]

{ #category : #'not implemented' }
GoogleCalendarListAPI >> patch [

"PATCH https://www.googleapis.com/calendar/v3/users/me/calendarList/calendarId"
]

{ #category : #'service api' }
GoogleCalendarListAPI >> update [

"PUT https://www.googleapis.com/calendar/v3/users/me/calendarList/calendarId"
]

{ #category : #'not implemented' }
GoogleCalendarListAPI >> watch [

"POST https://www.googleapis.com/calendar/v3/users/me/calendarList/watch"
]
