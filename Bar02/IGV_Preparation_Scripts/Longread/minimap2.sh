#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=8
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=300g
#SBATCH --time=48:00:00
#SBATCH --job-name=minimap2
#SBATCH --output=/share/BioinfMSc/rotation1/group2/merged_files/logs/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/group2/merged_files/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxas26@exmail.nottingham.ac.uk

source $HOME/.bash_profile

conda activate minimap2
minimap2 -a /share/BioinfMSc/rotation1/group2/reference/refcombined1.fasta /share/BioinfMSc/rotation1/group2/merged_files/merged_pass_barcode02v2.fastq.gz > alignment.sam
conda deactivate 
