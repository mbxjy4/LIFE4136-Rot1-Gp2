#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=5g
#SBATCH --time=00:10:00
#SBATCH --job-name=passmerge_josh
#SBATCH --output=/share/BioinfMSc/rotationl/group2/merged_files/all_fastq/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotationl/group2/merged_files/all_fastq/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxjy4@exmail.nottingham.ac.uk
cd/share/BioinfMSc/rotationl/group2/merged_files
zcat merged_fail_barcode02v2.fastq.gz merged_pass_barcode02v2.fastq.gz | gzip > /share/BioinfMSc/rotation1/group2/merged_files/merged_all_barcode02v2.fastq.gz
