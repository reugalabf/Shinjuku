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

{ #category : #tests }
GoogleSheetsClientTest >> testClientConnect [

	self assert: client canCallAPI
]

{ #category : #tests }
GoogleSheetsClientTest >> testSpreadsheetGet [

	| json keys |
	self assert: client canCallAPI.
	json := (NeoJSONReader on: (client spreadsheet_get:
					          '1K8R6SdqK-U3_3HI5l50dBwCLuTZkKdYVlOk_d2lX6wI')
				         readStream)
		        propertyNamesAsSymbols: true;
		        next.
	json inspect.

	keys := Set
		        with: 'sheets'
		        with: 'spreadsheetUrl'
		        with: 'spreadsheetId'
		        with: 'properties'.

	self assert: (json keys asSet = keys)
]

{ #category : #tests }
GoogleSheetsClientTest >> testSpreadsheetGetObject [

	| spreadsheet json keys dictResult |
	self assert: client canCallAPI.
	dictResult := (NeoJSONReader on: (json := client spreadsheet_get:
					                        '1K8R6SdqK-U3_3HI5l50dBwCLuTZkKdYVlOk_d2lX6wI')
				               readStream)
		              propertyNamesAsSymbols: true;
		              next.

	self should: [ dictResult at: 'error' ] raise: Error.
	spreadsheet := (NeoJSONReader on: json readStream) nextAs:
		               GoogleSpreadsheet.
dictResult inspect.
	spreadsheet inspect
]
