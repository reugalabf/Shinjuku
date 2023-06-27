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
	#category : #'GoogleAPIClient-SpreadsheetEntities'
}

{ #category : #accessing }
GoogleSpreadsheetProperties class >> neoJsonMapping: mapper [
"'title locale autoRecalc timeZone defaultFormat iterativeCalculationSettings spreadsheetTheme' "

self halt
]
