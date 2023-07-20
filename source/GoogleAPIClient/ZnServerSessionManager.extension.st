Extension { #name : #ZnServerSessionManager }

{ #category : #'*GoogleAPIClient' }
ZnServerSessionManager >> hasSessionForKey: aString [

	^ sessions values anySatisfy: [ :each| each hasSessionForKey: aString ]
]

{ #category : #'*GoogleAPIClient' }
ZnServerSessionManager >> hasSessionForKey: aString scopes: aCollection [

	^ sessions values anySatisfy: [ :each| each hasSessionForKey: aString ]
]

{ #category : #'*GoogleAPIClient' }
ZnServerSessionManager >> sessionForKey: aString [

	^ sessions values
		  detect: [ :each | each hasSessionForKey: aString ]
		  ifFound: [ :obj | obj attributeAt: aString ]
		  ifNone: [ nil ]
]

{ #category : #'*GoogleAPIClient' }
ZnServerSessionManager >> sessionForKey: aString scopes: aCollection [

	^ sessions values
		  detect: [ :each | each hasSessionForKey: aString ]
		  ifFound: [ :obj | obj attributeAt: aString ]
		  ifNone: [ nil ]
]
