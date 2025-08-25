Extension { #name : 'AILinearRegressionLeastSquares' }

{ #category : '*PBA' }
AILinearRegressionLeastSquares >> meanSquaredErrorBetweenActual: actualValues andPredicted: predictedValues [

	^ (actualValues - predictedValues) squared sum / actualValues size
]
