#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=10g
#SBATCH --time=00:30:00
#SBATCH --job-name=all06merge
#SBATCH --output=/share/BioinfMSc/rotation1/group2/bar06/logs/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/group2/bar06/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxjy4@exmail.nottingham.ac.uk

cd /share/BioinfMSc/rotation1/group2/bar06/long_merged
zcat *.fastq.gz | gzip > /share/BioinfMSc/rotation1/group2/bar06/long_merged/all/merged_all_barcode06.fastq.gz
