Metacello new
		baseline: 'PBA';
		repository: 'github://FedeLoch/PBA:smallExp';
		onConflictUseIncoming;
		load.

(Smalltalk at: #PBADataframeVeritasBenchmarksExperiment) run
