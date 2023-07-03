Class {
	#name : #GoogleSheetValuesAPI,
	#superclass : #GoogleService,
	#category : #'GoogleAPIClient-ServiceBroker'
}

{ #category : #'sheet values' }
GoogleSheetValuesAPI >> valueAppend: aRange spredsheet: googleSpreadsheetId [
"POST https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/values/{range}:append"
]

{ #category : #'sheet values' }
GoogleSheetValuesAPI >> valueBatchClear: googleSpreadsheetId [
"POST https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/values:batchClear"
]

{ #category : #'sheet values' }
GoogleSheetValuesAPI >> valueBatchClearByDataFilter: googleSpreadsheetId [
"POST https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/values:batchClearByDataFilter"

"The URL uses gRPC Transcoding syntax."
]

{ #category : #'sheet values' }
GoogleSheetValuesAPI >> valueBatchGet: googleSpreadsheetId [
"GET https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/values:batchGet"

]

{ #category : #'sheet values' }
GoogleSheetValuesAPI >> valueBatchGetByDataFilter: googleSpreadsheetId [
"POST https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/values:batchGetByDataFilter"

"The URL uses gRPC Transcoding syntax."
]

{ #category : #'sheet values' }
GoogleSheetValuesAPI >> valueBatchUpdate: googleSpreadsheetId [
"POST https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/values:batchUpdate"
]

{ #category : #'sheet values' }
GoogleSheetValuesAPI >> valueBatchUpdateByDataFilter: googleSpreadsheetId [
"POST https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/values:batchUpdateByDataFilter"

"The URL uses gRPC Transcoding syntax."
]

{ #category : #'sheet values' }
GoogleSheetValuesAPI >> valueClear: range spreadsheet:  googleSpreadsheetId [
"POST https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/values/{range}:clear"

"The URL uses gRPC Transcoding syntax."
]

{ #category : #'sheet values' }
GoogleSheetValuesAPI >> valueGet: range spreadsheet:  googleSpreadsheetId [
"GET https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/values/{range}"

"The URL uses gRPC Transcoding syntax."
]

{ #category : #'sheet values' }
GoogleSheetValuesAPI >> valueUpdate: range spreadsheet:  googleSpreadsheetId [
"PUT https://sheets.googleapis.com/v4/spreadsheets/{spreadsheetId}/values/{range}"

"The URL uses gRPC Transcoding syntax."
]
