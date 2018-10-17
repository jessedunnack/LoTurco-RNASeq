#!/bin/bash
#SBATCH --job-name=Quality_Control
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mem=128G
#SBATCH --mail-type=END
#SBATCH --mail-user=jesse.dunnack@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

######################################################
#         Change CPU cores (-c), RAM (-mem),         #
#     and partition according to job requirements!   #
######################################################

echo `hostname`

# Load required modules
module load AfterQC/0.9.0 python/2.7.14 fastqc MultiQC

# Create required directories
mkdir ../FastQC
mkdir ../FastQC/raw_reads
mkdir ../FastQC/filtered_reads
mkdir ../MultiQC
mkdir ../MultiQC/raw_reads
mkdir ../MultiQC/filtered_reads

# Perform FastQC then MultiQC on raw reads.
for file in ls *.gz; do fastqc --outdir ../FastQC/raw_reads/ $file; done
multiqc -d --outdir ../MultiQC/raw_reads/ ../FastQC/raw_reads/

# Run AfterQC to filter out poor quality reads, PolyX reads, and adapters.
python /isg/shared/apps/AfterQC/0.9.0/after.py -g ../filtered_reads -b ../bad_reads -r ../AfterQC_report

# Perform FastQC and MultiQC again on the trimmed reads.
cd ../filtered_reads
for file in ls *.fq; do fastqc --outdir ../FastQC/filtered_reads/ $file; done
multiqc -d --outdir ../MultiQC/filtered_reads/ ../FastQC/filtered_reads/
