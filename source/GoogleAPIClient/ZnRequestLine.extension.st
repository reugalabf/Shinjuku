Extension { #name : #ZnRequestLine }

{ #category : #'*GoogleAPIClient' }
ZnRequestLine >> uri [
	^ uri ifNil:[ZnUrl new] 
]
