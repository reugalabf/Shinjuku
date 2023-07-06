"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestGoogleAPIClient,
	#superclass : #PackageManifest,
	#category : #'GoogleAPIClient-Manifest'
}

{ #category : #'code-critics' }
ManifestGoogleAPIClient class >> ruleCollectionMessagesToExternalObjectRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#GoogleCalendarClient #initBlocks #false)) #'2022-11-02T16:32:22.228591-03:00') #(#(#RGClassDefinition #(#GoogleCalendarClient)) #'2022-11-02T16:32:41.874376-03:00') #(#(#RGMethodDefinition #(#GoogleSheetClient #initBlocks #false)) #'2023-07-06T14:48:57.305532-03:00') )
]
