Metacello new
		baseline: 'PBA';
		repository: 'github://FedeLoch/PBA:main';
		onConflictUseIncoming;
		load.

(Smalltalk at: #PBASmarkBenchmarksExperiment) run
