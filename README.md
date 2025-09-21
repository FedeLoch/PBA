# PBA - Pharo Benchmark Analyzer

PBA is a benchmark analyzer that integrates several program profilers to provide a complete series of execution feature results.

## Getting started

To install the framework, you must execute this Metacello script in your playground or add the project as a dependency.

```Smalltalk
Metacello new
    baseline: 'PBA';
    repository: 'github://FedeLoch/PBA:main';
    onConflictUseIncoming;
    load
```

## How does PBA work ?

PBA works with a simple analyzer API. PBAnalyzer could be extended by adding new strategies. The analyzer delegates to each strategy to execute the target program and merge their results.

A PBA default execution looks like the following:

```Smalltalk
PBAnalyzer new analyze: (PBASmarkBenchmarkpProgram bench: SMarkDeltaBlue new)
```

In case you don't want to use all the profilers at the same time, you can just do:

```Smalltalk
PBAnalyzer new profilers: { PBAMethodProfiler new }; analyze: program
```

The current available class profilers are:
- `PBABytecodeProfiler`
- `PBACallBacksProfiler`
- `PBACoverageCollectorProfiler`
- `PBAIllimaniProfiler`
- `PBAMethodProfiler`

### PBA Result

As a result, PBA provides a **PBAResult** which has a series of feature measurements:
- **Execution time**: The elapsed program time (in milliseconds).
- **Memory consumed**: The amount of memory consumed by the program execution (in bytes).
- **Average object allocation size**: The average (in bytes) of object size.
- **Average object lifetime**: The percentage of the average object lifetime.
- **Instance variable accesses**: The number of object instance variable accesses.
- **Static variable accesses**: The number of object static variable accesses.
- **Different executed blocks**: The number of different executed blocks.
- **Different executed bytecodes**: The number of different executed bytecodes.
- **Different methods called**: The number of different methods called.
- **Total executed bytecodes**: The total number of executed bytecodes during the program execution.
- **Total methods called**: The total number of methods called during the program execution.
- **Average of arguments**: The average of arguments per method called.
- **Total executed loops**: The total number executed loops.
- **Total executed blocks**: The total number executed blocks.
- **Different call sites**: The total number of different call sites during the program execution.

## Integrated Profilers

PBA uses two different profilers. On one hand, we use [Illimani](https://github.com/jordanmontt/illimani-memory-profiler), a memory profiler that provides us with object memory information.
On the other hand, we utilise [PBP](https://github.com/FedeLoch/PBP), our handmade bytecode profiler, which provides information about the executed bytecodes.

### Running Experiments

We designed a simplified API to facilitate the running of experiments. For example, the next line runs and analyze all `Smark` benchmarks:

```Smalltalk
    PBASmarkBenchmarksExperiment run
```

This will generate the next two files, `smark-benchmarks-features.csv` csv which lists all the benchmarks and their feature values. On another hand, this experiment will generate a `smark-benchmarks-pca.csv` CSV file with the PCA analysis applied to the executed features.

If you want to create your experiment, you need to define a subclass of `PBAExperiment` and define a method, for example, run. Then you only need to define the `benchmarks` method, and then by running the method `runExperiment: fileName`, it will execute and analyze all the benchmarks, generating the feature csv. 
