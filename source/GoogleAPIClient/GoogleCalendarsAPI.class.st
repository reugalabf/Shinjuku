Class {
	#name : #GoogleCalendarsAPI,
	#superclass : #GoogleService,
	#category : #'GoogleAPIClient-ServiceBroker'
}

{ #category : #'service api' }
GoogleCalendarsAPI >> clearCalendar: calendarId [

	"POST https://www.googleapis.com/calendar/v3/calendars/calendarId/clear"

	^ self postRequestForURL:
		  ('https://www.googleapis.com/calendar/v3/calendars/<1s>/clear' 
			   expandMacrosWith: calendarId)
]

{ #category : #'service api' }
GoogleCalendarsAPI >> deleteCalendar: calendarId [

	"DELETE https://www.googleapis.com/calendar/v3/calendars/calendarId"

	^ self deleteRequestForURL:
		  ('https://www.googleapis.com/calendar/v3/calendars/<1s>' 
			   expandMacrosWith: calendarId)
]

{ #category : #'service api' }
GoogleCalendarsAPI >> getCalendar: calendarId [

	"GET https://www.googleapis.com/calendar/v3/calendars/calendarId"

	^ self getRequestForURL:
		  ('https://www.googleapis.com/calendar/v3/calendars/<1s>' 
			   expandMacrosWith: calendarId)
]

{ #category : #'service api' }
GoogleCalendarsAPI >> insertCalendar [

	"POST https://www.googleapis.com/calendar/v3/calendars"

	^ self postRequestForURL:
		  'https://www.googleapis.com/calendar/v3/calendars'
]

{ #category : #'service api' }
GoogleCalendarsAPI >> patchCalendar: calendarId [
"PATCH https://www.googleapis.com/calendar/v3/calendars/calendarId"


]

{ #category : #'service api' }
GoogleCalendarsAPI >> updateCalendar: calendarId [

	"PUT https://www.googleapis.com/calendar/v3/calendars/calendarId"

	^ self putRequestForURL:
		  ('https://www.googleapis.com/calendar/v3/calendars/<1s>' 
			   expandMacrosWith: calendarId)
]
