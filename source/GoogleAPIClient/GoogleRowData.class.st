Class {
	#name : #GoogleRowData,
	#superclass : #Object,
	#instVars : [
		'values'
	],
	#category : #'GoogleAPIClient-SpreadsheetEntities'
}

{ #category : #accessing }
GoogleRowData class >> neoJsonMapping: mapper [

	mapper for: self do: [ :mapping | 
		(mapping mapInstVar: #values) valueSchema: #ArrayOfCellData ].

	mapper
		for: #ArrayOfCellData
		customDo: [ :mapping | mapping listOfElementSchema: GoogleCellData ]
]
