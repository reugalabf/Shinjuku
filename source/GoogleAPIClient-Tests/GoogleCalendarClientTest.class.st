Class {
	#name : #GoogleCalendarClientTest,
	#superclass : #TestCase,
	#instVars : [
		'client'
	],
	#category : #'GoogleAPIClient-Tests'
}

{ #category : #running }
GoogleCalendarClientTest >> setUp [

	super setUp.

	client := GoogleCalendarClient new
]

{ #category : #tests }
GoogleCalendarClientTest >> testCalendars_list [

	self assert: client halt canCallAPI
]
