Class {
	#name : #BaselineOfGoogleAPIClient,
	#superclass : #BaselineOf,
	#category : #BaselineOfGoogleAPIClient
}

{ #category : #baselines }
BaselineOfGoogleAPIClient >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		self neoBaselines: spec.
		self zincHTTPComponentsBaseline: spec.
		self ztimestampBaseline:spec.
		spec
			package: #GoogleAPIClient
			with: [ spec requires: #( 'NeoJSON'  'ZincHTTPComponents' ) ];
			package: #'GoogleAPIClient-Tests'
			with: [ spec requires: #( 'GoogleAPIClient' ) ].
		spec
			group: 'Core' with: #( 'GoogleAPIClient' );
			group: 'Tests' with: #( 'GoogleAPIClient-Tests' );
			group: 'default' with: #( 'Core' 'Tests' ) ]
]

{ #category : #baselines }
BaselineOfGoogleAPIClient >> neoBaselines: spec [

	spec
		baseline: 'NeoJSON'
		with: [ spec repository: 'github://svenvc/NeoJSON/repository' ].

"	spec
		baseline: 'NeoCSV'
		with: [ spec repository: 'github://svenvc/NeoCSV/repository' ]"
]

{ #category : #baselines }
BaselineOfGoogleAPIClient >> zincHTTPComponentsBaseline: spec [

	spec
		baseline: 'ZincHTTPComponents'
		with: [ spec 
			loads:#('SSO-OAuth2');
			repository: 'github://svenvc/zinc/repository' ]
]

{ #category : #baselines }
BaselineOfGoogleAPIClient >> ztimestampBaseline: spec [

	spec baseline: 'ztimestamp' with: [ 
		spec
			loads: #( 'common' );
			repository: 'https://github.com/svenvc/ztimestamp.git' ]
]
