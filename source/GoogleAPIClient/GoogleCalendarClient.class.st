Class {
	#name : #GoogleCalendarClient,
	#superclass : #GoogleServiceClient,
	#instVars : [
		'calendarListAPI',
		'eventsAPI'
	],
	#category : #'GoogleAPIClient-Client'
}

{ #category : #calendarList }
GoogleCalendarClient >> calendarList_delete: calendarId [

	^ calendarListAPI delete: calendarId
]

{ #category : #calendarList }
GoogleCalendarClient >> calendarList_get: calendarId [

	^ calendarListAPI get: calendarId
]

{ #category : #calendarList }
GoogleCalendarClient >> calendarList_insert [

	^ calendarListAPI insert
]

{ #category : #calendarList }
GoogleCalendarClient >> calendarList_list [

	^ calendarListAPI list
]

{ #category : #testing }
GoogleCalendarClient >> canCallAPI [

	^ authenticationServer isRunning and: [( 
		  authenticationServer sessionManager hasSessionForKey:
			  'google-session') and:[(authenticationServer sessionManager sessionForKey:
			  'google-session')isLive]]
]

{ #category : #events }
GoogleCalendarClient >> event_delete: eventId calendar: calendarId [

	^ eventsAPI deleteEvent: eventId ofCalendar: calendarId
]

{ #category : #events }
GoogleCalendarClient >> event_get: calendarId eventId: eventId [

	^ eventsAPI getEvent:eventId ofCalendar: calendarId
]

{ #category : #events }
GoogleCalendarClient >> event_insert: calendarId eventElement: anEvent [

	^ eventsAPI insert: calendarId event:anEvent
]

{ #category : #events }
GoogleCalendarClient >> event_list: calendarId [

	^ eventsAPI list: calendarId
]

{ #category : #events }
GoogleCalendarClient >> event_update: calendarId eventElement: anEvent [

	^ eventsAPI updateEvent: anEvent ofCalendar: calendarId
]

{ #category : #initialization }
GoogleCalendarClient >> initBlocks [

	^ OrderedCollection
		  with: [ :session | 
			  session
				  beConsentPrompt;
				  beOfflineAccessType ]
		  with: [ :session | 
			  session scopes addAll: (OrderedCollection
					   with: 'https://www.googleapis.com/auth/calendar.readonly'
					   with: 'https://www.googleapis.com/auth/calendar'
					   with:
					   'https://www.googleapis.com/auth/calendar.events.readonly'
					   with: 'https://www.googleapis.com/auth/calendar.events') ]
]

{ #category : #initialization }
GoogleCalendarClient >> initialize [

	super initialize.

	^ self
]

{ #category : #initialization }
GoogleCalendarClient >> initializeSettings: aDictionary [

	super initializeSettings: aDictionary.
	calendarListAPI := GoogleCalendarListAPI withSessionManager:
		                   authenticationServer sessionManager.
	eventsAPI := GoogleEventsAPI withSessionManager:
		             authenticationServer sessionManager.
	^ self
]
