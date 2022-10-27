Class {
	#name : #GoogleCalendarList,
	#superclass : #GoogleService,
	#category : #'GoogleAPIClient-ServiceBroker'
}

{ #category : #'service api' }
GoogleCalendarList >> delete: calendarId [

	"DELETE https://www.googleapis.com/calendar/v3/users/me/calendarList/calendarId"

	^ self deleteRequestForURL:
		  'https://www.googleapis.com/calendar/v3/users/me/calendarList/calendarId'
		  , calendarId
]

{ #category : #'service api' }
GoogleCalendarList >> get: calendarId [

	"GET https://www.googleapis.com/calendar/v3/users/me/calendarList/calendarId"

	"calendarId is a String"

	^ self getRequestForURL:
		  'https://www.googleapis.com/calendar/v3/users/me/calendarList'
		  , calendarId
]

{ #category : #'submorphs - add/remove' }
GoogleCalendarList >> insert [
"POST https://www.googleapis.com/calendar/v3/users/me/calendarList"
]

{ #category : #'service api' }
GoogleCalendarList >> list [

	^ self getRequestForURL:
		  'https://www.googleapis.com/calendar/v3/users/me/calendarList'
]

{ #category : #'submorphs - add/remove' }
GoogleCalendarList >> patch [

"PATCH https://www.googleapis.com/calendar/v3/users/me/calendarList/calendarId"
]

{ #category : #'submorphs - add/remove' }
GoogleCalendarList >> update [

"PUT https://www.googleapis.com/calendar/v3/users/me/calendarList/calendarId"
]

{ #category : #'submorphs - add/remove' }
GoogleCalendarList >> watch [

"POST https://www.googleapis.com/calendar/v3/users/me/calendarList/watch"
]
