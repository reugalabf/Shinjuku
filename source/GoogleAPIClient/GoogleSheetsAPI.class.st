Class {
	#name : #GoogleSheetsAPI,
	#superclass : #GoogleService,
	#category : #'GoogleAPIClient-ServiceBroker'
}

{ #category : #sheets }
GoogleSheetsAPI >> copySheet:aGoogleSheetId toSpreadSheet:aGoogleSpreadsheetId [	
	"Copies a single sheet from a spreadsheet to another spreadsheet. Returns the properties of the newly created sheet."
"POST https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/sheets/{sheetId}:copyTo"
]
