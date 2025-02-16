#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=8
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=300g
#SBATCH --time=48:00:00
#SBATCH --job-name=genovi06_1
#SBATCH --output=/share/BioinfMSc/rotation1/group2/merged_files/logs/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/group2/merged_files/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxas26@exmail.nottingham.ac.uk

source $HOME/.bash_profile

conda activate Genovi

genovi -i /share/BioinfMSc/rotation1/group2/bar06/prokka/prokka_hybrid1/PROKKA_02072025.gbk -cs strong -s complete --size

conda deactivate
