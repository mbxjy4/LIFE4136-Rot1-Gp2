#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=8
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=300g
#SBATCH --time=48:00:00
#SBATCH --job-name=minimap2_samtobamsortedjy
#SBATCH --output=/share/BioinfMSc/rotation1/group2/merged_files/logs/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/group2/merged_files/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxjy4@exmail.nottingham.ac.uk

source $HOME/.bash_profile

conda activate Samtools

samtools sort -o sorted_alignment1.bam alignment1.bam

conda deactivate
