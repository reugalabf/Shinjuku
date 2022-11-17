Class {
	#name : #GoogleEventsAPI,
	#superclass : #GoogleService,
	#category : #'GoogleAPIClient-ServiceBroker'
}

{ #category : #'service api' }
GoogleEventsAPI >> deleteEvent: eventId ofCalendar: calendarId [

	"DELETE https://www.googleapis.com/calendar/v3/calendars/calendarId/events/eventId"

	^ self deleteRequestForURL:
		  ('https://www.googleapis.com/calendar/v3/calendars/<1s>/events/<2s>'
			   expandMacrosWith: calendarId
			   with: eventId)
]

{ #category : #'service api' }
GoogleEventsAPI >> getEvent: eventId ofCalendar: calendarId [

	"GET https://www.googleapis.com/calendar/v3/calendars/calendarId/events/eventId"

	^ self getRequestForURL:
		  ('https://www.googleapis.com/calendar/v3/calendars/<1s>/events/<2s>'
			   expandMacrosWith: calendarId
			   with: eventId)
]

{ #category : #'service api' }
GoogleEventsAPI >> import: calendarId [

	"POST https://www.googleapis.com/calendar/v3/calendars/calendarId/events/import"

	^self postRequestForURL:
		('https://www.googleapis.com/calendar/v3/calendars/<1s>/events/import' 
			 expandMacrosWith: calendarId)
]

{ #category : #'service api' }
GoogleEventsAPI >> insert: calendarId [

	"POST https://www.googleapis.com/calendar/v3/calendars/calendarId/events"

	^ self postRequestForURL:
		  ('https://www.googleapis.com/calendar/v3/calendars/<1s>/events' 
			   expandMacrosWith: calendarId)
]

{ #category : #'service api' }
GoogleEventsAPI >> insert: calendarId event: anEvent [

	"POST https://www.googleapis.com/calendar/v3/calendars/calendarId/events"

	^ self postRequestForURL:
		  ('https://www.googleapis.com/calendar/v3/calendars/<1s>/events' 
			   expandMacrosWith: calendarId) contents: (NeoJSONWriter toString: anEvent)
]

{ #category : #'service api' }
GoogleEventsAPI >> instancesOfEvent: eventId ofCalendar: calendarId [

	"GET https://www.googleapis.com/calendar/v3/calendars/calendarId/events/eventId/instances"

	^ self getRequestForURL:
		  ('https://www.googleapis.com/calendar/v3/calendars/<1s>/events/<2s>/instances'
			   expandMacrosWith: calendarId
			   with: eventId)
]

{ #category : #'service api' }
GoogleEventsAPI >> list:calendarId [
"GET https://www.googleapis.com/calendar/v3/calendars/calendarId/events"

^self getRequestForURL: ('https://www.googleapis.com/calendar/v3/calendars/<1s>/events' expandMacrosWith: calendarId  )
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
GoogleEventsAPI >> updateEvent: event ofCalendar: calendarId [

	"PUT https://www.googleapis.com/calendar/v3/calendars/calendarId/events/eventId"

	| json |
	json := String streamContents: [ :stream | 
		        (NeoJSONWriter on: stream)
			        prettyPrint: true;
			        "mapInstVarsFor: PlaceAndTime ;"nextPut: event ].

	^ (self putRequestForURL:
		   ('https://www.googleapis.com/calendar/v3/calendars/<1s>/events/<2s>'
			    expandMacrosWith: calendarId
			    with: event id)) headers at: 'application/json' put: json
]

{ #category : #'service api' }
GoogleEventsAPI >> watch:calendarId [
"POST https://www.googleapis.com/calendar/v3/calendars/calendarId/events/watch"
]
