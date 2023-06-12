Class {
	#name : #GoogleSpreadsheetProperties,
	#superclass : #Object,
	#instVars : [
		'title',
		'locale',
		'autoRecalc',
		'timeZone',
		'defaultFormat',
		'iterativeCalculationSettings',
		'spreadsheetTheme'
	],
	#category : #'GoogleAPIClient-SpreadSheetEntities'
}

{ #category : #accessing }
GoogleSpreadsheetProperties class >> neoJsonMapping: mapper [
"'title locale autoRecalc timeZone defaultFormat iterativeCalculationSettings spreadsheetTheme' "

self halt
]
