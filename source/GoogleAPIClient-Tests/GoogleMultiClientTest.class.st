Class {
	#name : #GoogleMultiClientTest,
	#superclass : #TestCase,
	#instVars : [
		'calendar',
		'sheets',
		'garbageEvent'
	],
	#category : #'GoogleAPIClient-Tests'
}

{ #category : #initialization }
GoogleMultiClientTest >> setUp [

	super setUp.

	calendar := GoogleCalendarClient fromJson:
		            'calendarClientSettings3.json'.
	sheets := GoogleSheetClient fromJson: 'sheetsClientSettings2.json'

	"garbageEvent := OrderedCollection new."
]

{ #category : #tests }
GoogleMultiClientTest >> testClientConnect [

	self assert: calendar canCallAPI.
	self assert: sheets canCallAPI
]
