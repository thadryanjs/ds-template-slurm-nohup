# exit on error
set -e

# format R and Python code
R -e "library(styler); style_dir(recursive = FALSE)"
black .

SCRIPT0="00_script"
jupytext --sync $SCRIPT0.R && \
    jupyter nbconvert --execute $SCRIPT0.ipynb \
        --inplace  --ExecutePreprocessor.kernel_name=ir

SCRIPT1="01_script"
jupytext --sync $SCRIPT1.py && \
    jupyter nbconvert --execute $SCRIPT1.ipynb \
        --inplace --ExecutePreprocessor.kernel_name=python3

rm -rf build

jupyter-book build .

mv _build build
