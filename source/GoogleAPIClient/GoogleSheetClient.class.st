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

{ #category : #testing }
GoogleSheetClient >> canCallAPI [

	^ authenticationServer isRunning and: [( 
		  authenticationServer sessionManager hasSessionForKey:
			  'google-session') and:[(authenticationServer sessionManager sessionForKey:
			  'google-session')isLive]]
]

{ #category : #initialization }
GoogleSheetClient >> initBlocks [ 
	^ OrderedCollection
		  with: [ :session | 
			  session
				  beConsentPrompt;
				  beOfflineAccessType ]
		  with: [ :session | 
			  		session scopes addAll: (OrderedCollection
					   with: 'https://www.googleapis.com/auth/drive'
					   with: 'https://www.googleapis.com/auth/drive.file'
					   with:
					   'https://www.googleapis.com/auth/drive.readonly '
					   with: 'https://www.googleapis.com/auth/spreadsheets'
					with:'https://www.googleapis.com/auth/spreadsheets.readonly') ]
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

{ #category : #spreadsheetAPI }
GoogleSheetClient >> spreadsheet_get: spredsheetId [

	^ spreadsheetAPI getSpreadsheet:  spredsheetId
]
