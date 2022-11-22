Class {
	#name : #GoogleCalendarClientTest,
	#superclass : #TestCase,
	#instVars : [
		'client',
		'garbageEvent'
	],
	#category : #'GoogleAPIClient-Tests'
}

{ #category : #tests }
GoogleCalendarClientTest >> bodegaCalendarId [
"bodega1 calendar id: c1b1d2c918f8872aebc61fba7d59f7d84fede3e7e819f84e4d23004501c8bec2@group.calendar.google.com"
	^ 'c1b1d2c918f8872aebc61fba7d59f7d84fede3e7e819f84e4d23004501c8bec2@group.calendar.google.com'
]

{ #category : #tests }
GoogleCalendarClientTest >> bodegaEventId [ 
^'5mbrt1e068jalc1mli9gm88h44'
]

{ #category : #tests }
GoogleCalendarClientTest >> createEvent [

	^ client
		  event_insert: self bodegaCalendarId
		  eventElement: (GoogleEvent new
				   description: '|';
				   end: (DateAndTime fromString: '2022-11-7T11:11:00');
				   start: (DateAndTime fromString: '2022-11-7T11:10:00');
				   yourself)
]

{ #category : #running }
GoogleCalendarClientTest >> setUp [

	super setUp.

	client := GoogleCalendarClient fromJson: 'calendarClientSettings.json'.
	"garbageEvent := OrderedCollection new."
	
]

{ #category : #running }
GoogleCalendarClientTest >> tearDown [

	garbageEvent ifNil: [ ^ self ].

	client event_delete: garbageEvent calendar: self bodegaCalendarId
]

{ #category : #tests }
GoogleCalendarClientTest >> testCalendarList_get [

	| json |
	self assert: client canCallAPI.

	json := (NeoJSONReader on:
			         (client calendarList_get: self bodegaCalendarId) readStream)
		        propertyNamesAsSymbols: true;
		        next.




	self assert:( (json at:'kind') = 'calendar#calendarListEntry' )
]

{ #category : #tests }
GoogleCalendarClientTest >> testCalendarList_list [

	| json |
	self assert: client canCallAPI.

	json := (NeoJSONReader on: client calendarList_list readStream)
		        propertyNamesAsSymbols: true;
		        next.


json inspect.

	self assert: (json at: 'kind') = 'calendar#calendarList'
]

{ #category : #tests }
GoogleCalendarClientTest >> testEvents_get [

	| json response |
	self assert: client canCallAPI.
	response := client
		            event_get: self bodegaCalendarId
		            eventId: self bodegaEventId.
	response inspect.
	json := (NeoJSONReader on: response readStream)
		        propertyNamesAsSymbols: true;
		        next.
	self should: [ json at: 'error' ] raise: Error.
	json inspect.
	self assert: (json at: 'kind') = 'calendar#event'
]

{ #category : #tests }
GoogleCalendarClientTest >> testEvents_insert [

	| dictResult json cloudEvent |
	self assert: client canCallAPI.
	json := self createEvent.
	dictResult := (NeoJSONReader on: json readStream)
		              propertyNamesAsSymbols: true;
		              next.


	self should: [ dictResult at: 'error' ] raise: Error.
	cloudEvent := (NeoJSONReader on: json readStream) nextAs: GoogleEvent.

	garbageEvent := dictResult at: 'id'.


	self assert: (dictResult at: 'description') = '|'
]

{ #category : #tests }
GoogleCalendarClientTest >> testEvents_list [

	| json |
	self assert: client canCallAPI.

	json := (NeoJSONReader on:
			         (client event_list: self bodegaCalendarId) readStream)
		        propertyNamesAsSymbols: true;
		        next.
	self should: [json at: 'error'] raise: Error.

	self assert: (json at: 'kind') = 'calendar#events'
]

{ #category : #tests }
GoogleCalendarClientTest >> testEvents_update [

	| dictResult json cloudEvent newDescription |
	self assert: client canCallAPI.
	json := self createEvent.
	dictResult := (NeoJSONReader on: json readStream)
		              propertyNamesAsSymbols: true;
		              next.


	self should: [ dictResult at: 'error' ] raise: Error.
	cloudEvent := (NeoJSONReader on: json readStream) nextAs: GoogleEvent.
	cloudEvent description:
		(newDescription := cloudEvent description , '|').

	dictResult := (NeoJSONReader on:
			               (client
				                event_update: self bodegaCalendarId
				                eventElement: cloudEvent) readStream)
		              propertyNamesAsSymbols: true;
		              next.
	garbageEvent := dictResult at: 'id'.

	self should: [ dictResult at: 'error' ] raise: Error.

	self assert: (dictResult at: 'description') = newDescription
]
