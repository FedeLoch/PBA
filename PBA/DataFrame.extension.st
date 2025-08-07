Extension { #name : 'DataFrame' }

{ #category : '*PBA' }
DataFrame >> buildChartWithTitle: aString forCategories: categories withAxisNames: nameX and: nameY [

	| chart scatterPlotShapes |
	chart := RSCompositeChart new
		         title: aString;
		         yourself.
	scatterPlotShapes := categories collect: [ :type |
		                     (self select: [ :e | e values includes: type ])
			                     addScatterPlotShapeToChart: chart ].
	chart padding: 10.
	chart xlabel: nameX.
	chart ylabel: nameY.
	chart build.
	^ chart
]

{ #category : '*PBA' }
DataFrame >> buildLegendFor: categories in: chart [

	| legend |
	legend := RSLegend new.
	legend location
		right;
		middle;
		offset: 10 @ 0.
	categories doWithIndex: [ :lbl :index |
		legend text: lbl withBoxColor: (chart plots at: index) computeColor ].
	legend container: chart canvas.
	legend build
]

{ #category : '*PBA' }
DataFrame >> openScatterPlotWithTitle: aString forColumn: columnName withAxisNames: nameX and: nameY [

	| chart categories |
	categories := (self column: columnName) asSet sorted.

	chart := self
		         buildChartWithTitle: aString
		         forCategories: categories
		         withAxisNames: nameX
		         and: nameY.

	self buildLegendFor: categories in: chart.

	chart canvas open
]
