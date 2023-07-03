Class {
	#name : #GoogleSheetClient,
	#superclass : #GoogleServiceClient,
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
