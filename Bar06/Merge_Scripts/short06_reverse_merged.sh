#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=50g
#SBATCH --time=02:20:00
#SBATCH --job-name=short06_reverse_merge
#SBATCH --output=/share/BioinfMSc/rotation1/group2/bar06/logs/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/group2/bar06/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxjy4@exmail.nottingham.ac.uk

cd /share/BioinfMSc/Matt_resources/short_reads/Fastq
zcat *_S6_*_R2*.fastq.gz | gzip > /share/BioinfMSc/rotation1/group2/bar06/short_merged/merged_S6_reverse.fastq.gz
