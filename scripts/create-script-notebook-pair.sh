# example usage:
# sh scripts/create-script-notebook-pair.sh script-name R ir

# name the script
SCRIPTNAME=$1
# specify the file extension
EX=$2

# infer the kernel from the extension
if [ $EX = "R" ]; then
    KERNEL="ir"
elif [ $EX = "py" ]; then
    KERNEL="python3"
else
    echo "Kernel not found"; exit 1
fi

# create the script
touch $SCRIPTNAME.$EX
# convert the script to a book
jupytext $SCRIPTNAME.$EX --to notebook
# set the formats for the book
jupytext --set-formats ipynb,$EX:percent $SCRIPTNAME.ipynb
# set the kernel for that book
jupytext --set-kernel $KERNEL $SCRIPTNAME.$EX

