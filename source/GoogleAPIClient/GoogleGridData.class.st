Class {
	#name : #GoogleGridData,
	#superclass : #Object,
	#instVars : [
		'startRow',
		'startColumn',
		'rowData',
		'rowMetadata',
		'columnMetadata'
	],
	#category : #'GoogleAPIClient-SpreadsheetEntities'
}

{ #category : #accessing }
GoogleGridData class >> neoJsonMapping: mapper [

	mapper for: self do: [ :mapping | 
		mapping mapInstVars:
			#( startRow startColumn rowData rowMetadata columnMetadata ).

				(mapping mapInstVar: #rowData) valueSchema: #ArrayOfRowData ]

	.

	mapper
		for: #ArrayOfRowData
		customDo: [ :mapping | mapping listOfElementSchema: GoogleRowData ]

]
