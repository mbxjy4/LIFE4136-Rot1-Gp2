#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=8
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=300g
#SBATCH --time=48:00:00
#SBATCH --job-name=ref1_annotate
#SBATCH --output=/share/BioinfMSc/rotation1/group2/merged_files/logs/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/group2/merged_files/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxjy4@exmail.nottingham.ac.uk

source $HOME/.bash_profile

conda activate Prokka

cd /share/BioinfMSc/rotation1/group2/reference
prokka --outdir /share/BioinfMSc/rotation1/group2/reference/prokka_reference refcombined1.fasta

conda deactivate
