# Directory doodle / code

The directory doodle is continually updated with bash scripts for loading, running and submitting jobs to slurm. 
Once an analysis step has been performed, the doodle directory is cleaned up and rsync-ed to the code directory
in my project repository using the command 

	make codesync

Each computational step has a bash script for module loading and running the analysis. There is one main script for
submitting jobs which is run by

	. runjobs.sh mytool

if the tool "mytool" is to be run. This will submit a slurm job to Snowy with a name connected to the tool "mytool".
The code to run the tool should be in run_mytool.sh. This is in order to load once, be able to test the code before 
submitting a job and organization. The load files have the prefix load_ and the running files the prefix run_, each
followed by an appropriate name.
