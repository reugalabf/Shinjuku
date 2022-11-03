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

{ #category : #running }
GoogleCalendarClientTest >> setUp [

	super setUp.

	client := GoogleCalendarClient new
]

{ #category : #tests }
GoogleCalendarClientTest >> testCalendarList_get [

	| json |
	self assert: client canCallAPI.

	json := (NeoJSONReader on:
			         (client getCalendarList: self bodegaCalendarId) readStream)
		        propertyNamesAsSymbols: true;
		        next.




	self assert:( (json at:'kind') = 'calendar#calendarListEntry' )
]

{ #category : #tests }
GoogleCalendarClientTest >> testCalendarList_list [

	| json |
	self assert: client canCallAPI.

	json := (NeoJSONReader on: client listCalendarList readStream)
		        propertyNamesAsSymbols: true;
		        next.




	self assert: (json at: 'kind') = 'calendar#calendarList'
]
