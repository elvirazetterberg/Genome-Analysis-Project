# Directory doodle / code

The directory doodle is continually updated with bash scripts for loading, running and submitting jobs to slurm. 
Once an analysis step has been performed, the doodle directory is cleaned up and rsync-ed to the code directory
in my project repository. Each computational step has three bash scripts, one for module loading, one for running 
and another for submitting jobs. This is in order to load once, be able to test the code before submitting a job 
and organization. They are listed in that order below.

The directory contains:
* pre-processing
> * prepro_load.sh
> * quality_trim.sh
> * jobqual.sh

* assembly
> * canu_load.sh
> * assemble_canu.sh
> * job_canu.sh

* quality report
> * quast_load.sh
> * run_quast.sh
> * job_quast.sh

* polishing assembly
> * pilon_load.sh
> * run_pilon.sh
> * job_pilon.sh

quast_load.sh


