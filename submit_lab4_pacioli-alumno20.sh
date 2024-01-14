#!/bin/bash
# NOTE:
# --cpus-per-task parameter controls the number of
# cpus needed to run the current job.
#
# If your application runs sequentially, please set
# --cpus-per-task=1
# If you need to reserve the full node, please set
# --cpus-per-task=26

#SBATCH -p hpc-bio-pacioli
#SBATCH --chdir=/home/alumno20/
#SBATCH -J lab2_alumno20
#SBATCH --cpus-per-task=1
#SBATCH --mail-type=NONE   # END/START/NONE
#SBATCH --mail-user=yourmail@um.es
#SBATCH --output=alumno20-%j.out
#SBATCH  --ntasks=4


for archivo in HPC-Bio/fastq/*.fastq
do
	srun -n 1 file-cut.sh "$archivo" &
done
wait

echo "Procesos finalizados"

