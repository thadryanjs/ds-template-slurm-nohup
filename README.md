
## Setup

To set up a new notebook/script:

```bash
# R
sh scripts/create-script-notebook-pair.sh 00_script R
# python
sh scripts/create-script-notebook-pair.sh 01_script py
```


## Build

Using nohup for smaller jobs (that take a handful of minutes and I wait on), or slurm on the full dataset. I don't use slurm exclusively to a to avoid making to many small request of the scheduler. To run the build script, use:

```bash
sh scripts/run.sh nohup
# for smaller jobs, or, for larger jobs:
sh scripts/run.sh slurm
```

To do partial builds or run a single script I just comment out chunks of the actual `scripts/build-book.sh`. A little hacky, but simple and effective.


