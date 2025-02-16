#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=300g
#SBATCH --time=48:00:00
#SBATCH --job-name=quast06_2
#SBATCH --output=/share/BioinfMSc/rotation1/group2/bar06/logs/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/group2/bar06/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxjy4@exmail.nottingham.ac.uk

source $HOME/.bash_profile

conda activate Quast

quast /share/BioinfMSc/rotation1/group2/bar06/long_merged/pass/assembly/assembly.fasta \
/share/BioinfMSc/rotation1/group2/bar06/short_merged/assembly/assembly.fasta \
/share/BioinfMSc/rotation1/group2/bar06/hybrid/assembly/assembly.fasta \
-r /share/BioinfMSc/rotation1/group2/quast/refcombined1.fasta -o quast06_2

conda deactivate
