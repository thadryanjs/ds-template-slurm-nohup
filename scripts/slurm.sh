#!/bin/sh
#SBATCH --job-name="NEMSIS"
#SBATCH --error="_log.out"
#SBATCH --output="_log.out"
#SBATCH --time=1-00:00:00
#SBATCH --mem=40G
#SBATCH --mail-type=BEGIN,END,FAIL

# exit if anything fails
set -e

# note the id in the output
echo "SLURM ID: $SLURM_JOB_ID" > _log.out

sh scripts/build-book.sh
