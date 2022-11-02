Class {
	#name : #EventParty,
	#superclass : #Object,
	#instVars : [
		'id',
		'email',
		'displayName',
		'organizer',
		'selfEvent',
		'resource',
		'optional',
		'responseStatus',
		'comment',
		'additionalGuests'
	],
	#category : #'GoogleAPIClient-CalendarEntities'
}

{ #category : #accessing }
EventParty class >> neoJsonMapping: mapper [


	mapper for: self do: [ :mapping | 
		mapping mapInstVars:
			#( id email displayName organizer selfEvent resource optional
			   responseStatus comment additionalGuests ) ]
]
