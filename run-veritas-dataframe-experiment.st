Metacello new
		baseline: 'PBA';
		repository: 'github://FedeLoch/PBA:expDataframe';
		onConflictUseIncoming;
		load.

(Smalltalk at: #PBADataframeVeritasBenchmarksExperiment) run