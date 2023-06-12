Class {
	#name : #GoogleSheetClient,
	#superclass : #GoogleServiceClient,
	#category : #'GoogleAPIClient-Client'
}

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
