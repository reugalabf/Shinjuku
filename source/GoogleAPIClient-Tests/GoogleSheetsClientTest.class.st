Class {
	#name : #GoogleSheetsClientTest,
	#superclass : #TestCase,
	#instVars : [
		'client',
		'garbageEvent'
	],
	#category : #'GoogleAPIClient-Tests'
}

{ #category : #initialization }
GoogleSheetsClientTest >> setUp [

	super setUp.

	client := GoogleSheetClient  fromJson:
		          'sheetsClientSettings.json'

	"garbageEvent := OrderedCollection new."
]
