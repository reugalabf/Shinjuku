Class {
	#name : #GoogleCellData,
	#superclass : #Object,
	#instVars : [
		'userEnteredValue',
		'effectiveValue',
		'formattedValue',
		'userEnteredFormat',
		'effectiveFormat',
		'hyperlink',
		'note',
		'textFormatRuns',
		'dataValidation',
		'pivotTable',
		'dataSourceTable',
		'dataSourceFormula'
	],
	#category : #'GoogleAPIClient-SpreadsheetEntities'
}

{ #category : #accessing }
GoogleCellData class >> neoJsonMapping: mapper [
"userEnteredValue effectiveValue formattedValue userEnteredFormat effectiveFormat hyperlink note textFormatRuns dataValidation pivotTable dataSourceTable dataSourceFormula"

	mapper for: self do: [ :mapping | 
		mapping mapInstVars:
			#(  effectiveValue formattedValue userEnteredFormat effectiveFormat hyperlink note textFormatRuns dataValidation pivotTable dataSourceTable dataSourceFormula ). 

		(mapping mapInstVar: #userEnteredValue) valueSchema: GoogleExtendedValue ].

"	mapper mapInstVarsFor: GoogleRowData. 

	mapper
		for: #ArrayOfRowData
		customDo: [ :mapping | mapping listOfElementSchema: GoogleRowData ]
"

]
