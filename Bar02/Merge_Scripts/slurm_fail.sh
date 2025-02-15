#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=5g
#SBATCH --time=00:10:00
#SBATCH --job-name=fail_longreads
#SBATCH --output=/gpfs01/share/BioinfMSc/rotation1/group2/merged_files/fail_fastq/slurm-%x-%j.out
#SBATCH --error=/gpfs01/share/BioinfMSc/rotation1/group2/merged_files/fail_fastq/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxas26@exmail.nottingham.ac.uk

cd /share/BioinfMSc/Matt_resources/long_reads/fastq_fail/barcode02
zcat *.fastq.gz | gzip > /share/BioinfMSc/rotation1/group2/merged_files/merged_fail_barcode02v2.fastq.gz

