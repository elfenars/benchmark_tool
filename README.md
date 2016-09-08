# load_test

_Run a load test using Apache Benchmark against the current PI infrastructure_

### IMPORTANT

#### **DO NOT RUN THIS AGAINST PRODUCTION**

**...or at least not without letting your closest DevOps know first...**

_...and even so, expect him to probably say "NO" anyway..._

---

### Requirements:

  * [Apache Benchmark 2.3+](https://httpd.apache.org/docs/2.4/programs/ab.html)
  * [Gnuplot](http://www.gnuplot.info/)

### Usage:

You need to set the total amount of requests you want to make and how many of them are going to run concurrently using the `TOTAL` and `CONCURRENT` env vars.


```bash
 $ ./run_benchmarks.sh <total_requests> <concurrency> <benchmark_name>
```

* The plotted graphs can be found inside the `plots` folder.

* For more details check inside each benchmark's `output` folder.

* All outputted files are named with this structure `<benchmark_name>_date('%d%m%Y')_time(%H%M%S)`

    This way you can pair plotted results with their according outputs.

* In case you want to clean all your results, you can run `scripts/delete_results.sh`.

---

### Add new benchmarks:

1. **Folder structure:**

    ```
    base_dir/
    ├───benchmarks/
    ├─────<benchmark_folder>
    ├───────output/
    ├───────benchmark.sh
    ├───────plot.p
    ├───plots/
    ├───scripts/
    ├───run_benchmarks.sh
    ```

    The `benchmarks` folder contains all your custom benchmarks, inside it you should create:

    The `output` folder contains everything the `benchmark.sh` script creates as output (logfiles, csv, gnuplot logs, etc...).

    The `benchmark.sh` file contains all the logic to the benchmark itself **without the plotting**. (Don't forget to chmod it for execution).

    The `plot.p` is a gnuplot file which contains the configuration that gnuplot must follow for creating the images.

3. **Plots Folder:**

    Contains graphs from the benchmark plotted with GnuPlot.

3. **Scripts Folder:**

    The `run_single_benchmark.sh` acts as a wrapper for all the steps of the benchmark (The actual benchmark and plotting the graph).

    It takes `<benchmark_name>` name as a parameter. **You should not need to call this file, unless you know what you're doing.**

    Additionally there's a `delete_results.sh` script that will clean all contents of all `output` and `plots`.

3. **Main script:**

    The `run_benchmarks.sh` script acts as a wrapper for all benchmarks and allows the user to define the **total amount of requests**, **concurrency** and call more than one benchmark.





