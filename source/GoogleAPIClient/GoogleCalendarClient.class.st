Class {
	#name : #GoogleCalendarClient,
	#superclass : #GoogleServiceClient,
	#category : #'GoogleAPIClient-Client'
}

{ #category : #initialization }
GoogleCalendarClient >> authenticationPort [

	^ '8100'
]

{ #category : #initialization }
GoogleCalendarClient >> initBlocks [

	^ OrderedCollection
		  with: [ :session | 
			  session
				  beConsentPrompt;
				  beOfflineAccessType ]
		  with: [ :session | 
			  session scopes addAll: (OrderedCollection
					   with: 'https://www.googleapis.com/auth/calendar.readonly'
					   with: 'https://www.googleapis.com/auth/calendar'
					   with:
					   'https://www.googleapis.com/auth/calendar.events.readonly '
					   with: 'https://www.googleapis.com/auth/calendar.events') ]
]

{ #category : #initialization }
GoogleCalendarClient >> redirectUrl [

	^ 'http://localhost:8100/sso-google-callback'
]

{ #category : #initialization }
GoogleCalendarClient >> serviceKey [

	^ '984973766290-6uf0t0ujs2a8erap02s9kh20ts1c69ge.apps.googleusercontent.com'
]

{ #category : #initialization }
GoogleCalendarClient >> serviceSecret [

	^ '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'
]
