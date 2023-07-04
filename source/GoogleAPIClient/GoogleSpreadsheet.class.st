Class {
	#name : #GoogleSpreadsheet,
	#superclass : #Object,
	#instVars : [
		'spreadsheetId',
		'properties',
		'sheets',
		'namedRanges',
		'spreadsheetUrl',
		'developerMetadata',
		'dataSources',
		'dataSourceSchedules'
	],
	#category : #'GoogleAPIClient-SpreadsheetEntities'
}

{ #category : #accessing }
GoogleSpreadsheet class >> neoJsonMapping: mapper [

	"id properties sheets namedRanges url developerMetadata dataSources dataSourceSchedules"

	mapper for: self do: [ :mapping | 
		mapping mapInstVars:
			#( spreadsheetId properties namedRanges spreadsheetUrl
			   developerMetadata dataSources dataSourceSchedules ). "sheets"

		(mapping mapInstVar: #sheets) valueSchema: #ArrayOfSheet ].

	mapper mapInstVarsFor: GoogleSheet. 

	mapper
		for: #ArrayOfSheet
		customDo: [ :mapping | mapping listOfElementSchema: GoogleSheet ]


	"(mapping mapInstVar: #created) valueSchema: #DateAndTime.
		(mapping mapInstVar: #updated) valueSchema: #DateAndTime.

		(mapping mapInstVar: #creator) valueSchema: EventParty.
		(mapping mapInstVar: #organizer) valueSchema: EventParty.

		(mapping mapInstVar: #attendees) valueSchema: #ArrayOfEventParty.


		(mapping mapInstVar: #start) valueSchema: #TimeStamp.
		(mapping mapInstVar: #end) valueSchema: #TimeStamp.
		(mapping mapInstVar: #originalStartTime) valueSchema: #TimeStamp
"

	"	mapper
		for: #TimeStamp
		customDo: [ :mapping | ""date dateTime timeZone""
			mapping encoder: [ :obj | 
				Dictionary new
					at: 'dateTime' put: obj asDate yyyymmdd , 'T' , obj hhmmss , obj offset hhmm;

						yourself ].
			mapping decoder: [ :obj | 
				DateAndTime fromString: (obj at: #dateTime)
				""(obj at: #date) , 'T' ,"" ] ].

	mapper
		for: #DateAndTime
		customDo: [ :mapping | ""date dateTime timeZone""
			mapping encoder: [ :obj | obj asDate yyyymmdd ].
			mapping decoder: [ :obj | DateAndTime fromString: obj ] ].

	mapper mapInstVarsFor: EventParty.

	mapper
		for: #ArrayOfEventParty
		customDo: [ :mapping | mapping listOfElementSchema: EventParty ]"
]
