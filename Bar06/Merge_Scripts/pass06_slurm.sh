#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=10g
#SBATCH --time=00:30:00
#SBATCH --job-name=pass06merge
#SBATCH --output=/share/BioinfMSc/rotation1/group2/bar06/logs/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/group2/bar06/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxjy4@exmail.nottingham.ac.uk

cd /share/BioinfMSc/Matt_resources/long_reads/fastq_pass/barcode06
zcat *.fastq.gz | gzip > /share/BioinfMSc/rotation1/group2/bar06/long_merged/pass/merged_pass_barcode06.fastq.gz
