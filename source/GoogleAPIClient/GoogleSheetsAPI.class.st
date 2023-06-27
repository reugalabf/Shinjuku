Class {
	#name : #GoogleSheetsAPI,
	#superclass : #GoogleService,
	#category : #'GoogleAPIClient-ServiceBroker'
}

{ #category : #spreadsheets }
GoogleSheetsAPI >> batchUpdateSpreadsheet:aGoogleSpreadsheetId [
"POST https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}:batchUpdate"
]

{ #category : #sheets }
GoogleSheetsAPI >> copySheet:aGoogleSheetId toSpreadSheet:aGoogleSpreadsheetId [	
	"Copies a single sheet from a spreadsheet to another spreadsheet. Returns the properties of the newly created sheet."
"POST https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/sheets/{sheetId}:copyTo"
]

{ #category : #spreadsheets }
GoogleSheetsAPI >> createSpreadsheet [
"https://developers.google.com/sheets/api/reference/rest/v4/spreadsheets/create"
]

{ #category : #spreadsheets }
GoogleSheetsAPI >> getByDataFilterSpreadsheet:aGoogleSpreadsheetId [	
"POST https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}:getByDataFilter"
]

{ #category : #spreadsheets }
GoogleSheetsAPI >> getSpreadsheet:aGoogleSpreadsheetId [
"GET https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}"
]

{ #category : #'sheet values' }
GoogleSheetsAPI >> valueAppend: aRange spredsheet: googleSpreadsheetId [
"POST https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/values/{range}:append"
]

{ #category : #'sheet values' }
GoogleSheetsAPI >> valueBatchClear: googleSpreadsheetId [
"POST https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/values:batchClear"
]

{ #category : #'sheet values' }
GoogleSheetsAPI >> valueBatchClearByDataFilter: googleSpreadsheetId [
"POST https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/values:batchClearByDataFilter"

"The URL uses gRPC Transcoding syntax."
]

{ #category : #'sheet values' }
GoogleSheetsAPI >> valueBatchGet: googleSpreadsheetId [
"GET https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/values:batchGet"

]

{ #category : #'sheet values' }
GoogleSheetsAPI >> valueBatchGetByDataFilter: googleSpreadsheetId [
"POST https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/values:batchGetByDataFilter"

"The URL uses gRPC Transcoding syntax."
]

{ #category : #'sheet values' }
GoogleSheetsAPI >> valueBatchUpdate: googleSpreadsheetId [
"POST https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/values:batchUpdate"
]

{ #category : #'sheet values' }
GoogleSheetsAPI >> valueBatchUpdateByDataFilter: googleSpreadsheetId [
"POST https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/values:batchUpdateByDataFilter"

"The URL uses gRPC Transcoding syntax."
]

{ #category : #'sheet values' }
GoogleSheetsAPI >> valueClear: range spreadsheet:  googleSpreadsheetId [
"POST https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/values/{range}:clear"

"The URL uses gRPC Transcoding syntax."
]

{ #category : #'sheet values' }
GoogleSheetsAPI >> valueGet: range spreadsheet:  googleSpreadsheetId [
"GET https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/values/{range}"

"The URL uses gRPC Transcoding syntax."
]

{ #category : #'sheet values' }
GoogleSheetsAPI >> valueUpdate: range spreadsheet:  googleSpreadsheetId [
"PUT https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/values/{range}"

"The URL uses gRPC Transcoding syntax."
]
