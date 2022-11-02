Class {
	#name : #GoogleCalendar,
	#superclass : #Object,
	#instVars : [
		'kind',
		'etag',
		'id',
		'summary',
		'description',
		'location',
		'timeZone',
		'conferenceProperties'
	],
	#category : #'GoogleAPIClient-CalendarEntities'
}

{ #category : #accessing }
GoogleCalendar class >> neoJsonMapping: mapper [


	mapper for: self do: [ :mapping | 
		mapping mapInstVars:
			#( kind etag id summary description location timeZone conferenceProperties  ) ]	
]

{ #category : #accessing }
GoogleCalendar >> conferenceProperties [

	^ conferenceProperties
]

{ #category : #accessing }
GoogleCalendar >> conferenceProperties: anObject [

	conferenceProperties := anObject
]

{ #category : #accessing }
GoogleCalendar >> description [

	^ description
]

{ #category : #accessing }
GoogleCalendar >> description: anObject [

	description := anObject
]

{ #category : #accessing }
GoogleCalendar >> etag [

	^ etag
]

{ #category : #accessing }
GoogleCalendar >> etag: anObject [

	etag := anObject
]

{ #category : #accessing }
GoogleCalendar >> id [

	^ id
]

{ #category : #accessing }
GoogleCalendar >> id: anObject [

	id := anObject
]

{ #category : #accessing }
GoogleCalendar >> kind [

	^ kind
]

{ #category : #accessing }
GoogleCalendar >> kind: anObject [

	kind := anObject
]

{ #category : #accessing }
GoogleCalendar >> location [

	^ location
]

{ #category : #accessing }
GoogleCalendar >> location: anObject [

	location := anObject
]

{ #category : #accessing }
GoogleCalendar >> summary [

	^ summary
]

{ #category : #accessing }
GoogleCalendar >> summary: anObject [

	summary := anObject
]

{ #category : #accessing }
GoogleCalendar >> timeZone [

	^ timeZone
]

{ #category : #accessing }
GoogleCalendar >> timeZone: anObject [

	timeZone := anObject
]
