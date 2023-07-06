Class {
	#name : #GoogleSheet,
	#superclass : #Object,
	#instVars : [
		'properties',
		'data',
		'merges',
		'conditionalFormats',
		'filterViews',
		'protectedRanges',
		'basicFilter',
		'charts',
		'bandedRanges',
		'developerMetadata',
		'rowGroups',
		'columnGroups',
		'slicers'
	],
	#category : #'GoogleAPIClient-SpreadsheetEntities'
}

{ #category : #accessing }
GoogleSheet class >> neoJsonMapping: mapper [

	"properties data merges conditionalFormats filterViews protectedRanges basicFilter charts bandedRanges developerMetadata rowGroups columnGroups slicers"

	mapper for: self do: [ :mapping | 
		mapping mapInstVars:
			#( properties merges conditionalFormats filterViews protectedRanges
			   basicFilter charts bandedRanges developerMetadata
			   rowGroups columnGroups slicers ).

		(mapping mapInstVar: #data) valueSchema: #ArrayOfGridData ].


	mapper
		for: #ArrayOfGridData
		customDo: [ :mapping | mapping listOfElementSchema: GoogleGridData ]
]
