#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=8
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=300g
#SBATCH --time=48:00:00
#SBATCH --job-name=quast_1
#SBATCH --output=/share/BioinfMSc/rotation1/group2/merged_files/logs/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/group2/merged_files/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxjy4@exmail.nottingham.ac.uk

source $HOME/.bash_profile

conda activate Quast

quast /share/BioinfMSc/rotation1/group2/merged_files/pass_fastq/assembly/assembly.fasta \
/share/BioinfMSc/rotation1/group2/merged_short/assembly/assembly.fasta \
/share/BioinfMSc/rotation1/group2/hybrid/assembly/assembly.fasta -o quast_1

conda deactivate
