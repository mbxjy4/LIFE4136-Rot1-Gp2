#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=5g
#SBATCH --time=00:20:00
#SBATCH --job-name=short_forward_merge
#SBATCH --output=/share/BioinfMSc/rotation1/group2/merged_files/logs/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/group2/merged_files/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxjy4@exmail.nottingham.ac.uk

cd /share/BioinfMSc/Matt_resources/short_reads/Fastq
zcat H3929_S2_L001_R1_001.fastq.gz H3929_S2_L002_R1_001.fastq.gz H3929_S2_L003_R1_001.fastq.gz H3929_S2_L004_R1_001.fastq.gz | gzip > /share/BioinfMSc/rotation1/group2/merged_short/forward/merged_S2_forward.fastq.gz
