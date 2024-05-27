# Rockfish Commands

## Connect to Rockfish

`ssh cs601-asandhu9@login.rockfish.jhu.edu`

## Upload Files

`scp -r .\code\ cs601-asandhu9@rfdtn1.rockfish.jhu.edu:/home/cs601-asandhu9`

## Change Python Version

`ml load python/3.11.6`

## Create Enviornment

`python -m venv ./ssm_hw5`
`source ./ssm_hw5/bin/activate`
`pip install -r requirements.txt`

## Load sbatch

`sbatch sbatch.sh`

## Check Job Status

`squeue -job [job-id]`

## Download Files

`scp -r cs601-asandhu9@rfdtn1.rockfish.jhu.edu:/home/cs601-asandhu9/hw6/ .\out\`
