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
	#name : #Event,
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
		'startTime',
		'endTime',
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
		'eventType'
	],
	#category : #'GoogleAPIClient-CalendarEntities'
}
