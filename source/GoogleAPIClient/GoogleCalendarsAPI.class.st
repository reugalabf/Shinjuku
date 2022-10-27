Class {
	#name : #GoogleCalendarsAPI,
	#superclass : #GoogleService,
	#category : #'GoogleAPIClient-ServiceBroker'
}

{ #category : #'service api' }
GoogleCalendarsAPI >> clearCalendar: calendarId [
"POST https://www.googleapis.com/calendar/v3/calendars/calendarId/clear"


]

{ #category : #'service api' }
GoogleCalendarsAPI >> deleteCalendar: calendarId [
"DELETE https://www.googleapis.com/calendar/v3/calendars/calendarId"


]

{ #category : #'service api' }
GoogleCalendarsAPI >> getCalendar: calendarId [
"GET https://www.googleapis.com/calendar/v3/calendars/calendarId"


]

{ #category : #'service api' }
GoogleCalendarsAPI >> insertCalendar [ 
"POST https://www.googleapis.com/calendar/v3/calendars"


]

{ #category : #'service api' }
GoogleCalendarsAPI >> patchCalendar: calendarId [
"PATCH https://www.googleapis.com/calendar/v3/calendars/calendarId"


]

{ #category : #'service api' }
GoogleCalendarsAPI >> updateCalendar: calendarId [
"PUT https://www.googleapis.com/calendar/v3/calendars/calendarId"


]
