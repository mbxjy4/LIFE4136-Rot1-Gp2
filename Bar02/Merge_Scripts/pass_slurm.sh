#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=5g
#SBATCH --time=00:15:00
#SBATCH --job-name=passmerge_jy
#SBATCH --output=/share/BioinfMSc/rotation1/group2/merged_files/pass_fastq/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/group2/merged_files/pass_fastq/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxjy4@exmail.nottingham.ac.uk

cd /share/BioinfMSc/Matt_resources/long_reads/fastq_pass/barcode02
zcat *.fastq.gz | gzip > /share/BioinfMSc/rotation1/group2/merged_files/merged_pass_barcode02v2.fastq.gz
