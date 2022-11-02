"
Toggle comment to access json description :-)


{
  ""kind"": ""calendar#calendarListEntry"",
  ""etag"": etag,
  ""id"": string,
  ""summary"": string,
  ""description"": string,
  ""location"": string,
  ""timeZone"": string,
  ""summaryOverride"": string,
  ""colorId"": string,
  ""backgroundColor"": string,
  ""foregroundColor"": string,
  ""hidden"": boolean,
  ""selected"": boolean,
  ""accessRole"": string,
  ""defaultReminders"": [
    {
      ""method"": string,
      ""minutes"": integer
    }
  ],
  ""notificationSettings"": {
    ""notifications"": [
      {
        ""type"": string,
        ""method"": string
      }
    ]
  },
  ""primary"": boolean,
  ""deleted"": boolean,
  ""conferenceProperties"": {
    ""allowedConferenceSolutionTypes"": [
      string
    ]
  }
}
"
Class {
	#name : #CalendarListEntry,
	#superclass : #Object,
	#instVars : [
		'kind',
		'etag',
		'id',
		'summary',
		'description',
		'location',
		'timeZone',
		'summaryOverride',
		'colorId',
		'backgroundColor',
		'foregroundColor',
		'hidden',
		'selected',
		'accessRole',
		'defaultReminders',
		'notificationSettings',
		'notifications',
		'primary',
		'deleted',
		'conferenceProperties',
		'allowedConferenceSolutionTypes'
	],
	#category : #'GoogleAPIClient-CalendarEntities'
}
