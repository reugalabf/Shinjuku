"
sheetId : integer. The sheet this range is on.

startRowIndex : integer. The start row (inclusive) of the range, or not set if unbounded.

endRowIndex : integer. The end row (exclusive) of the range, or not set if unbounded.

startColumnIndex : integer. The start column (inclusive) of the range, or not set if unbounded.

endColumnIndex: integer. The end column (exclusive) of the range, or not set if unbounded.


"
Class {
	#name : #GridRange,
	#superclass : #Object,
	#instVars : [
		'sheetId',
		'startRowIndex',
		'endRowIndex',
		'startColumnIndex',
		'endColumnIndex'
	],
	#category : #'GoogleAPIClient-SpreadsheetEntities'
}
