Class {
	#name : #GoogleSpreadsheetsAPI,
	#superclass : #GoogleService,
	#category : #'GoogleAPIClient-ServiceBroker'
}

{ #category : #spreadsheets }
GoogleSpreadsheetsAPI >> batchUpdateSpreadsheet:aGoogleSpreadsheetId [
"POST https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}:batchUpdate"
]

{ #category : #spreadsheets }
GoogleSpreadsheetsAPI >> createSpreadsheet [
"POST https://developers.google.com/sheets/api/reference/rest/v4/spreadsheets/create"
]

{ #category : #spreadsheets }
GoogleSpreadsheetsAPI >> getByDataFilterSpreadsheet:aGoogleSpreadsheetId [	
"POST https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}:getByDataFilter"
]

{ #category : #spreadsheets }
GoogleSpreadsheetsAPI >> getSpreadsheet: aGoogleSpreadsheetId [

	"GET https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}"

	^ self getSpreadsheet: aGoogleSpreadsheetId includeGridData: false
]

{ #category : #spreadsheets }
GoogleSpreadsheetsAPI >> getSpreadsheet:aGoogleSpreadsheetId includeGridData: aBoolean [
"GET https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}"

	^ self getRequestForURL:
		  ('https://sheets.googleapis.com/v4/spreadsheets/<1s>?includeGridData=<2p>' 
			   expandMacrosWith: aGoogleSpreadsheetId with: aBoolean )
]
