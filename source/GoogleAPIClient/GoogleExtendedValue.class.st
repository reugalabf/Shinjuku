Class {
	#name : #GoogleExtendedValue,
	#superclass : #Object,
	#instVars : [
		'numberValue',
		'stringValue',
		'bolValue',
		'formulaValue',
		'errorValue'
	],
	#category : #'GoogleAPIClient-SpreadsheetEntities'
}

{ #category : #accessing }
GoogleExtendedValue class >> neoJsonMapping: mapper [

	mapper for: self do: [ :mapping | 
		mapping mapInstVars:
			#( numberValue stringValue bolValue formulaValue errorValue ) ]
]
