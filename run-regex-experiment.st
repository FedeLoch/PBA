Metacello new
		baseline: 'PBA';
		repository: 'github://FedeLoch/PBA:main';
		onConflictUseIncoming;
		load.

Metacello new
		baseline: 'PBT';
		repository: 'github://FedeLoch/PBT:main';
		onConflictUseIncoming;
		load.

(Smalltalk at: #PBARegexBenchmarksExperiment) runFromFile: '../regexes.txt'
