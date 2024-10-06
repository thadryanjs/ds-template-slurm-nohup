# exit if anything fails
set -e

# make sure there is a command passed:
if [ $# -eq 0 ]; then
  echo "No command provided. Exiting."
  exit
fi

# time stamp and save the log file if there is one
if [ -f _log.out ]; then
    mv _log.out logs/_log_$(date +"%Y%m%d_%H%M%S").out
fi

# delete all but the 5 most recent files in logs
ls -t logs | tail -n +6 | xargs -I {} rm logs/{}

# if using conda, replace the following with the correct source path
# # source and activate conda
# source /optnfs/common/miniconda3/etc/profile.d/conda.sh
# conda activate triforecast
# # note env in case it has been updated
# conda env export > _environment.yaml

# if the first command arg is "nohup":
if [ "$1" = "nohup" ]; then
    SCRIPTNAME="sh scripts/build-book.sh"
    nohup sh -c \
      "echo Start time: $(date); echo Main PID: $$; echo $1; $SCRIPTNAME" \
       > _log.out 2>&1 &
fi

# if the first command arg is "slurm":
if [ "$1" = "slurm" ]; then
    sbatch scripts/slurm.sh
    # add $1 to top of _log.out
    echo $1 > _log.out
fi
