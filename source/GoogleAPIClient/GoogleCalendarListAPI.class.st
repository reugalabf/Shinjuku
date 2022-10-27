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

{ #category : #'submorphs - add/remove' }
GoogleCalendarListAPI >> insert [
"POST https://www.googleapis.com/calendar/v3/users/me/calendarList"
]

{ #category : #'service api' }
GoogleCalendarListAPI >> list [

	^ self getRequestForURL:
		  'https://www.googleapis.com/calendar/v3/users/me/calendarList'
]

{ #category : #'submorphs - add/remove' }
GoogleCalendarListAPI >> patch [

"PATCH https://www.googleapis.com/calendar/v3/users/me/calendarList/calendarId"
]

{ #category : #'submorphs - add/remove' }
GoogleCalendarListAPI >> update [

"PUT https://www.googleapis.com/calendar/v3/users/me/calendarList/calendarId"
]

{ #category : #'submorphs - add/remove' }
GoogleCalendarListAPI >> watch [

"POST https://www.googleapis.com/calendar/v3/users/me/calendarList/watch"
]
