"
{
  ""kind"": ""calendar#event"",
  ""etag"": etag,
  ""id"": string,
  ""status"": string,
  ""htmlLink"": string,
  ""created"": datetime,
  ""updated"": datetime,
  ""summary"": string,
  ""description"": string,
  ""location"": string,
  ""colorId"": string,
  ""creator"": {
    ""id"": string,
    ""email"": string,
    ""displayName"": string,
    ""self"": boolean
  },
  ""organizer"": {
    ""id"": string,
    ""email"": string,
    ""displayName"": string,
    ""self"": boolean
  },
  ""start"": {
    ""date"": date,
    ""dateTime"": datetime,
    ""timeZone"": string
  },
  ""end"": {
    ""date"": date,
    ""dateTime"": datetime,
    ""timeZone"": string
  },
  ""endTimeUnspecified"": boolean,
  ""recurrence"": [
    string
  ],
  ""recurringEventId"": string,
  ""originalStartTime"": {
    ""date"": date,
    ""dateTime"": datetime,
    ""timeZone"": string
  },
  ""transparency"": string,
  ""visibility"": string,
  ""iCalUID"": string,
  ""sequence"": integer,
  ""attendees"": [
    {
      ""id"": string,
      ""email"": string,
      ""displayName"": string,
      ""organizer"": boolean,
      ""self"": boolean,
      ""resource"": boolean,
      ""optional"": boolean,
      ""responseStatus"": string,
      ""comment"": string,
      ""additionalGuests"": integer
    }
  ],
  ""attendeesOmitted"": boolean,
  ""extendedProperties"": {
    ""private"": {
      (key): string
    },
    ""shared"": {
      (key): string
    }
  },
  ""hangoutLink"": string,
  ""conferenceData"": {
    ""createRequest"": {
      ""requestId"": string,
      ""conferenceSolutionKey"": {
        ""type"": string
      },
      ""status"": {
        ""statusCode"": string
      }
    },
    ""entryPoints"": [
      {
        ""entryPointType"": string,
        ""uri"": string,
        ""label"": string,
        ""pin"": string,
        ""accessCode"": string,
        ""meetingCode"": string,
        ""passcode"": string,
        ""password"": string
      }
    ],
    ""conferenceSolution"": {
      ""key"": {
        ""type"": string
      },
      ""name"": string,
      ""iconUri"": string
    },
    ""conferenceId"": string,
    ""signature"": string,
    ""notes"": string,
  },
  ""gadget"": {
    ""type"": string,
    ""title"": string,
    ""link"": string,
    ""iconLink"": string,
    ""width"": integer,
    ""height"": integer,
    ""display"": string,
    ""preferences"": {
      (key): string
    }
  },
  ""anyoneCanAddSelf"": boolean,
  ""guestsCanInviteOthers"": boolean,
  ""guestsCanModify"": boolean,
  ""guestsCanSeeOtherGuests"": boolean,
  ""privateCopy"": boolean,
  ""locked"": boolean,
  ""reminders"": {
    ""useDefault"": boolean,
    ""overrides"": [
      {
        ""method"": string,
        ""minutes"": integer
      }
    ]
  },
  ""source"": {
    ""url"": string,
    ""title"": string
  },
  ""attachments"": [
    {
      ""fileUrl"": string,
      ""title"": string,
      ""mimeType"": string,
      ""iconLink"": string,
      ""fileId"": string
    }
  ],
  ""eventType"": string
}
"
Class {
	#name : #GoogleEvent,
	#superclass : #Object,
	#instVars : [
		'kind',
		'etag',
		'id',
		'status',
		'htmlLink',
		'created',
		'updated',
		'summary',
		'description',
		'location',
		'colorId',
		'creator',
		'organizer',
		'endTimeUnspecified',
		'recurrence',
		'recurringEventId',
		'originalStartTime',
		'transparency',
		'visibility',
		'iCalUID',
		'sequence',
		'attendees',
		'attendeesOmitted',
		'extendedProperties',
		'hangoutLink',
		'conferenceData',
		'gadget',
		'anyoneCanAddSelf',
		'guestsCanInviteOthers',
		'guestsCanModify',
		'guestsCanSeeOtherGuests',
		'privateCopy',
		'locked',
		'reminders',
		'source',
		'attachments',
		'eventType',
		'start',
		'end'
	],
	#category : #'GoogleAPIClient-CalendarEntities'
}

{ #category : #accessing }
GoogleEvent class >> neoJsonMapping: mapper [

	"kind etag id status htmlLink created updated summary description location colorId creator organizer startTime endTime endTimeUnspecified recurrence recurringEventId originalStartTime transparency visibility iCalUID sequence attendees attendeesOmitted extendedProperties hangoutLink conferenceData gadget anyoneCanAddSelf guestsCanInviteOthers guestsCanModify guestsCanSeeOtherGuests privateCopy locked reminders source attachments eventType"

	mapper for: self do: [ :mapping | 
		mapping mapInstVars:
			#( kind etag id status htmlLink summary description location
			   colorId endTimeUnspecified recurrence recurringEventId
			   transparency visibility iCalUID sequence attendeesOmitted
			   extendedProperties hangoutLink conferenceData gadget anyoneCanAddSelf
			   guestsCanInviteOthers guestsCanModify guestsCanSeeOtherGuests
			   privateCopy locked reminders source attachments eventType ).
		(mapping mapInstVar: #created) valueSchema: #TimeStamp.
		(mapping mapInstVar: #updated) valueSchema: #TimeStamp.
		(mapping mapInstVar: #created) valueSchema: EventParty.
		(mapping mapInstVar: #start) valueSchema: #Timestamp.
		(mapping mapInstVar: #end) valueSchema: #TimeStamp.
		(mapping mapInstVar: #originalStartTime) valueSchema: #TimeStamp.
		(mapping mapInstVar: #created) valueSchema: #ArrayOfEventParty ].
	mapper
		for: #TimeStamp
		customDo: [ :mapping | "date dateTime timeZone"
			mapping encoder: [ :obj | 
				Dictionary new
					at: 'date' put: obj asDate yyyymmdd;
					at: 'dateTime'
					put: obj hours printString , ':' , obj minutes printString;
					"at: 'timeZone' put: (obj offset hours)printString;"yourself ].
			mapping decoder: [ :obj | 
				DateAndTime fromString:
					(obj at: #date) , 'T' , (obj at: #dateTime) ] ].
	mapper mapInstVarsFor: EventParty.
	mapper
		for: #ArrayOfEventParty
		customDo: [ :mapping | mapping listOfElementSchema: EventParty ]
]

{ #category : #accessing }
GoogleEvent >> anyoneCanAddSelf [

	^ anyoneCanAddSelf
]

{ #category : #accessing }
GoogleEvent >> anyoneCanAddSelf: anObject [

	anyoneCanAddSelf := anObject
]

{ #category : #accessing }
GoogleEvent >> attachments [

	^ attachments
]

{ #category : #accessing }
GoogleEvent >> attachments: anObject [

	attachments := anObject
]

{ #category : #accessing }
GoogleEvent >> attendees [

	^ attendees
]

{ #category : #accessing }
GoogleEvent >> attendees: anObject [

	attendees := anObject
]

{ #category : #accessing }
GoogleEvent >> attendeesOmitted [

	^ attendeesOmitted
]

{ #category : #accessing }
GoogleEvent >> attendeesOmitted: anObject [

	attendeesOmitted := anObject
]

{ #category : #accessing }
GoogleEvent >> colorId [

	^ colorId
]

{ #category : #accessing }
GoogleEvent >> colorId: anObject [

	colorId := anObject
]

{ #category : #accessing }
GoogleEvent >> conferenceData [

	^ conferenceData
]

{ #category : #accessing }
GoogleEvent >> conferenceData: anObject [

	conferenceData := anObject
]

{ #category : #accessing }
GoogleEvent >> created [

	^ created
]

{ #category : #accessing }
GoogleEvent >> created: anObject [

	created := anObject
]

{ #category : #accessing }
GoogleEvent >> creator [

	^ creator
]

{ #category : #accessing }
GoogleEvent >> creator: anObject [

	creator := anObject
]

{ #category : #accessing }
GoogleEvent >> description [

	^ description
]

{ #category : #accessing }
GoogleEvent >> description: anObject [

	description := anObject
]

{ #category : #accessing }
GoogleEvent >> end [

	^ end
]

{ #category : #accessing }
GoogleEvent >> end: anObject [

	end := anObject
]

{ #category : #accessing }
GoogleEvent >> endTime [

	^ end
]

{ #category : #accessing }
GoogleEvent >> endTime: anObject [

	end := anObject
]

{ #category : #accessing }
GoogleEvent >> endTimeUnspecified [

	^ endTimeUnspecified
]

{ #category : #accessing }
GoogleEvent >> endTimeUnspecified: anObject [

	endTimeUnspecified := anObject
]

{ #category : #accessing }
GoogleEvent >> etag [

	^ etag
]

{ #category : #accessing }
GoogleEvent >> etag: anObject [

	etag := anObject
]

{ #category : #accessing }
GoogleEvent >> eventType [

	^ eventType
]

{ #category : #accessing }
GoogleEvent >> eventType: anObject [

	eventType := anObject
]

{ #category : #accessing }
GoogleEvent >> extendedProperties [

	^ extendedProperties
]

{ #category : #accessing }
GoogleEvent >> extendedProperties: anObject [

	extendedProperties := anObject
]

{ #category : #accessing }
GoogleEvent >> gadget [

	^ gadget
]

{ #category : #accessing }
GoogleEvent >> gadget: anObject [

	gadget := anObject
]

{ #category : #accessing }
GoogleEvent >> guestsCanInviteOthers [

	^ guestsCanInviteOthers
]

{ #category : #accessing }
GoogleEvent >> guestsCanInviteOthers: anObject [

	guestsCanInviteOthers := anObject
]

{ #category : #accessing }
GoogleEvent >> guestsCanModify [

	^ guestsCanModify
]

{ #category : #accessing }
GoogleEvent >> guestsCanModify: anObject [

	guestsCanModify := anObject
]

{ #category : #accessing }
GoogleEvent >> guestsCanSeeOtherGuests [

	^ guestsCanSeeOtherGuests
]

{ #category : #accessing }
GoogleEvent >> guestsCanSeeOtherGuests: anObject [

	guestsCanSeeOtherGuests := anObject
]

{ #category : #accessing }
GoogleEvent >> hangoutLink [

	^ hangoutLink
]

{ #category : #accessing }
GoogleEvent >> hangoutLink: anObject [

	hangoutLink := anObject
]

{ #category : #accessing }
GoogleEvent >> htmlLink [

	^ htmlLink
]

{ #category : #accessing }
GoogleEvent >> htmlLink: anObject [

	htmlLink := anObject
]

{ #category : #accessing }
GoogleEvent >> iCalUID [

	^ iCalUID
]

{ #category : #accessing }
GoogleEvent >> iCalUID: anObject [

	iCalUID := anObject
]

{ #category : #accessing }
GoogleEvent >> id [

	^ id
]

{ #category : #accessing }
GoogleEvent >> id: anObject [

	id := anObject
]

{ #category : #accessing }
GoogleEvent >> kind [

	^ kind
]

{ #category : #accessing }
GoogleEvent >> kind: anObject [

	kind := anObject
]

{ #category : #accessing }
GoogleEvent >> location [

	^ location
]

{ #category : #accessing }
GoogleEvent >> location: anObject [

	location := anObject
]

{ #category : #accessing }
GoogleEvent >> locked [

	^ locked
]

{ #category : #accessing }
GoogleEvent >> locked: anObject [

	locked := anObject
]

{ #category : #accessing }
GoogleEvent >> organizer [

	^ organizer
]

{ #category : #accessing }
GoogleEvent >> organizer: anObject [

	organizer := anObject
]

{ #category : #accessing }
GoogleEvent >> originalStartTime [

	^ originalStartTime
]

{ #category : #accessing }
GoogleEvent >> originalStartTime: anObject [

	originalStartTime := anObject
]

{ #category : #accessing }
GoogleEvent >> privateCopy [

	^ privateCopy
]

{ #category : #accessing }
GoogleEvent >> privateCopy: anObject [

	privateCopy := anObject
]

{ #category : #accessing }
GoogleEvent >> recurrence [

	^ recurrence
]

{ #category : #accessing }
GoogleEvent >> recurrence: anObject [

	recurrence := anObject
]

{ #category : #accessing }
GoogleEvent >> recurringEventId [

	^ recurringEventId
]

{ #category : #accessing }
GoogleEvent >> recurringEventId: anObject [

	recurringEventId := anObject
]

{ #category : #accessing }
GoogleEvent >> reminders [

	^ reminders
]

{ #category : #accessing }
GoogleEvent >> reminders: anObject [

	reminders := anObject
]

{ #category : #accessing }
GoogleEvent >> sequence [

	^ sequence
]

{ #category : #accessing }
GoogleEvent >> sequence: anObject [

	sequence := anObject
]

{ #category : #accessing }
GoogleEvent >> source [

	^ source
]

{ #category : #accessing }
GoogleEvent >> source: anObject [

	source := anObject
]

{ #category : #accessing }
GoogleEvent >> start [

	^ start
]

{ #category : #accessing }
GoogleEvent >> start: anObject [

	start := anObject
]

{ #category : #accessing }
GoogleEvent >> startTime [

	^ start
]

{ #category : #accessing }
GoogleEvent >> startTime: anObject [

	start := anObject
]

{ #category : #accessing }
GoogleEvent >> status [

	^ status
]

{ #category : #accessing }
GoogleEvent >> status: anObject [

	status := anObject
]

{ #category : #accessing }
GoogleEvent >> summary [

	^ summary
]

{ #category : #accessing }
GoogleEvent >> summary: anObject [

	summary := anObject
]

{ #category : #accessing }
GoogleEvent >> transparency [

	^ transparency
]

{ #category : #accessing }
GoogleEvent >> transparency: anObject [

	transparency := anObject
]

{ #category : #accessing }
GoogleEvent >> updated [

	^ updated
]

{ #category : #accessing }
GoogleEvent >> updated: anObject [

	updated := anObject
]

{ #category : #accessing }
GoogleEvent >> visibility [

	^ visibility
]

{ #category : #accessing }
GoogleEvent >> visibility: anObject [

	visibility := anObject
]
