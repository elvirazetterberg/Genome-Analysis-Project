LOG=$(shell date --iso=seconds)

all:
	@echo "Hello Elvira"

git:
	cd ../Genome-Analysis-Project; echo "Adding and committing"; git add *; git commit -m "$LOG"; git push

codesync:
	@if compgen -G "slurm*" > /dev/null; then rm slurm*; fi;\
	rsync -r --delete /home/elze3417/genome_analysis/doodle/ /home/elze3417/genome_analysis/Genome-Analysis-Project/code/
