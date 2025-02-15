#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=8
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=300g
#SBATCH --time=48:00:00
#SBATCH --job-name=bwa
#SBATCH --output=/share/BioinfMSc/rotation1/group2/merged_files/logs/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/group2/merged_files/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxjy4@exmail.nottingham.ac.uk

source $HOME/.bash_profile

conda activate BWA

bwa index /share/BioinfMSc/rotation1/group2/reference/refcombined1.fasta
bwa mem /share/BioinfMSc/rotation1/group2/reference/refcombined1.fasta /share/BioinfMSc/rotation1/group2/merged_short/merged_S2_forward.fastq.gz /share/BioinfMSc/rotation1/group2/merged_short/merged_S2_reverse.fastq.gz > shortread02_3.sam

conda deactivate
