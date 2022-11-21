Class {
	#name : #GoogleCalendarClientTest,
	#superclass : #TestCase,
	#instVars : [
		'client'
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

{ #category : #running }
GoogleCalendarClientTest >> setUp [

	super setUp.

	client := GoogleCalendarClient fromJson: 'calendarClientSettings.json'
	
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

	| json |
	self assert: client canCallAPI.

	json := (NeoJSONReader on: (client
				          event_insert:
					          self bodegaCalendarId 
				          eventElement: (GoogleEvent new
						          end: (DateAndTime fromString: '2022-11-7T11:11:00');
									start: (DateAndTime fromString: '2022-11-7T11:10:00');
						           yourself)) readStream)
		        propertyNamesAsSymbols: true;
		        next.
	self should: [json at: 'error'] raise: Error.	

	self assert: (json at: 'kind') = 'calendar#event'
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
