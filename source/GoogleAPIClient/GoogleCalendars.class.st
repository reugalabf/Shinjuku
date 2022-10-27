Class {
	#name : #GoogleCalendars,
	#superclass : #GoogleService,
	#category : #'GoogleAPIClient-ServiceBroker'
}

{ #category : #'service api' }
GoogleCalendars >> clear: calendarId [
"POST https://www.googleapis.com/calendar/v3/calendars/calendarId/clear"


]

{ #category : #'service api' }
GoogleCalendars >> delete: calendarId [
"DELETE https://www.googleapis.com/calendar/v3/calendars/calendarId"


]

{ #category : #'service api' }
GoogleCalendars >> get: calendarId [
"GET https://www.googleapis.com/calendar/v3/calendars/calendarId"


]

{ #category : #'service api' }
GoogleCalendars >> insert [ 
"POST https://www.googleapis.com/calendar/v3/calendars"


]

{ #category : #'service api' }
GoogleCalendars >> patch: calendarId [
"PATCH https://www.googleapis.com/calendar/v3/calendars/calendarId"


]

{ #category : #'service api' }
GoogleCalendars >> update: calendarId [
"PUT https://www.googleapis.com/calendar/v3/calendars/calendarId"


]
