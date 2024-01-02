#!/bin/bash

# Assign the first argument to 'arg'
arg=$1

# Deactivate any active conda environment and activate 'Chad'
conda deactivate
conda activate Chad

# Check if the argument is 1
if [ "$arg" -eq 1 ]; then
    # Open the Visual Studio Code at the specified directory
    code "$HOME/Docs/Dev/Chad"
fi

# Change directory to the source control folder
cd "$HOME/Docs/Dev/Chad/source_control"

# Run the Streamlit application
streamlit run Chad.py
