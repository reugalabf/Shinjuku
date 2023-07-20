Class {
	#name : #GoogleSheetClient,
	#superclass : #GoogleServiceClient,
	#instVars : [
		'spreadsheetAPI',
		'sheetsAPI',
		'sheetValuesAPI'
	],
	#category : #'GoogleAPIClient-Client'
}

{ #category : #initialization }
GoogleSheetClient >> initBlocks [

	^ OrderedCollection
		  with: [ :session | 
			  session
				  beConsentPrompt;
				  beOfflineAccessType ]
		  with: [ :session | session scopes addAll: self requiredScopes ]
]

{ #category : #initialization }
GoogleSheetClient >> initializeSettings: aDictionary [

	super initializeSettings: aDictionary.
	spreadsheetAPI := GoogleSpreadsheetsAPI withSessionManager:
		                  authenticationServer sessionManager.
	sheetsAPI := GoogleSheetsAPI withSessionManager:
		             authenticationServer sessionManager.
	sheetValuesAPI := GoogleSheetValuesAPI withSessionManager:
		                  authenticationServer sessionManager.
	^ self
]

{ #category : #initialization }
GoogleSheetClient >> requiredScopes [

	^ OrderedCollection
		  with: 'https://www.googleapis.com/auth/drive'
		  with: 'https://www.googleapis.com/auth/drive.file'
		  with: 'https://www.googleapis.com/auth/drive.readonly'
		  with: 'https://www.googleapis.com/auth/spreadsheets'
		  with: 'https://www.googleapis.com/auth/spreadsheets.readonly'
]

{ #category : #spreadsheetAPI }
GoogleSheetClient >> spreadsheet_get: spredsheetId [

	^ spreadsheetAPI getSpreadsheet:  spredsheetId
]

{ #category : #spreadsheetAPI }
GoogleSheetClient >> spreadsheet_get: spredsheetId includeGridData: aBoolean [

	^ spreadsheetAPI
		  getSpreadsheet: spredsheetId
		  includeGridData: aBoolean
]
