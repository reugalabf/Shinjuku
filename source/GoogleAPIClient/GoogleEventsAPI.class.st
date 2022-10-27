Class {
	#name : #GoogleEventsAPI,
	#superclass : #GoogleService,
	#category : #'GoogleAPIClient-ServiceBroker'
}

{ #category : #'service api' }
GoogleEventsAPI >> deleteEvent:eventId ofCalendar: calendarId [
"DELETE https://www.googleapis.com/calendar/v3/calendars/calendarId/events/eventId"
]

{ #category : #'service api' }
GoogleEventsAPI >> getEvent:eventId ofCalendar: calendarId [
"GET https://www.googleapis.com/calendar/v3/calendars/calendarId/events/eventId"
]

{ #category : #'service api' }
GoogleEventsAPI >> import:calendarId [
"POST https://www.googleapis.com/calendar/v3/calendars/calendarId/events/import"
]

{ #category : #'service api' }
GoogleEventsAPI >> insert:calendarId [
"POST https://www.googleapis.com/calendar/v3/calendars/calendarId/events"
]

{ #category : #'service api' }
GoogleEventsAPI >> instancesOfEvent:eventId ofCalendar: calendarId [
"GET https://www.googleapis.com/calendar/v3/calendars/calendarId/events/eventId/instances"
]

{ #category : #'service api' }
GoogleEventsAPI >> list:calendarId [
"GET https://www.googleapis.com/calendar/v3/calendars/calendarId/events"
]

{ #category : #'service api' }
GoogleEventsAPI >> moveEvent: eventId ofCalendar: calendarId toCalendar: newCalendarId [

	"POST https://www.googleapis.com/calendar/v3/calendars/calendarId/events/eventId/move
Required query parameters
destination	string	Calendar identifier of the target calendar where the event is to be moved to.
"

	
]

{ #category : #'service api' }
GoogleEventsAPI >> patchEvent:eventId ofCalendar: calendarId [
"PATCH https://www.googleapis.com/calendar/v3/calendars/calendarId/events/eventId"
]

{ #category : #'service api' }
GoogleEventsAPI >> quickAdd:calendarId withText: text [
"POST https://www.googleapis.com/calendar/v3/calendars/calendarId/events/quickAdd"
"Required query parameters
text:string	 The text describing the event to be created."
]

{ #category : #'service api' }
GoogleEventsAPI >> updateEvent:eventId ofCalendar: calendarId [
"PUT https://www.googleapis.com/calendar/v3/calendars/calendarId/events/eventId"
]

{ #category : #'service api' }
GoogleEventsAPI >> watch:calendarId [
"POST https://www.googleapis.com/calendar/v3/calendars/calendarId/events/watch"
]
