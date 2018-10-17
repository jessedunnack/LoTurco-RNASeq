#!/bin/bash
#SBATCH --job-name=Alignment
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 16
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mem=200G
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
module load hisat2/2.0.5 samtools

# Establish required directories.
mkdir ../Alignment

# Create environment variable shortcut to mouse genome index
index=/isg/shared/databases/alignerIndex/animal/mus_musculus/HISAT2

# Run Hisat2 to align samples to reference genome.
hisat2 -p 16 -x $index/Mus_musculus --dta \
	-1 ./61_S10_L001_R1_001.good.fq,./61_S10_L002_R1_001.good.fq,./61_S10_L003_R1_001.good.fq,./61_S10_L004_R1_001.good.fq \
	-2 ./61_S10_L001_R2_001.good.fq,./61_S10_L002_R2_001.good.fq,./61_S10_L003_R2_001.good.fq,./61_S10_L004_R2_001.good.fq \
	-S ../Alignment/T1.sam

hisat2 -p 16 -x $index/Mus_musculus --dta \
	-1 ./63_S3_L001_R1_001.good.fq,./63_S3_L002_R1_001.good.fq,./63_S3_L003_R1_001.good.fq,./63_S3_L004_R1_001.good.fq \
	-2 ./63_S3_L001_R2_001.good.fq,./63_S3_L002_R2_001.good.fq,./63_S3_L003_R2_001.good.fq,./63_S3_L004_R2_001.good.fq \
	-S ../Alignment/T3.sam

hisat2 -p 16 -x $index/Mus_musculus --dta \
	-1 ./64_S2_L001_R1_001.good.fq,./64_S2_L002_R1_001.good.fq,./64_S2_L003_R1_001.good.fq,./64_S2_L004_R1_001.good.fq \
	-2 ./64_S2_L001_R2_001.good.fq,./64_S2_L002_R2_001.good.fq,./64_S2_L003_R2_001.good.fq,./64_S2_L004_R2_001.good.fq \
	-S ../Alignment/C1.sam

hisat2 -p 16 -x $index/Mus_musculus --dta \
	-1 ./65_S8_L001_R1_001.good.fq,./65_S8_L002_R1_001.good.fq,./65_S8_L003_R1_001.good.fq,./65_S8_L004_R1_001.good.fq \
	-2 ./65_S8_L001_R2_001.good.fq,./65_S8_L002_R2_001.good.fq,./65_S8_L003_R2_001.good.fq,./65_S8_L004_R2_001.good.fq \
	-S ../Alignment/C2.sam

hisat2 -p 16 -x $index/Mus_musculus --dta \
	-1 ./66_S7_L001_R1_001.good.fq,./66_S7_L002_R1_001.good.fq,./66_S7_L003_R1_001.good.fq,./66_S7_L004_R1_001.good.fq \
	-2 ./66_S7_L001_R2_001.good.fq,./66_S7_L002_R2_001.good.fq,./66_S7_L003_R2_001.good.fq,./66_S7_L004_R2_001.good.fq \
	-S ../Alignment/T4.sam

hisat2 -p 16 -x $index/Mus_musculus --dta \
	-1 ./67_S11_L001_R1_001.good.fq,./67_S11_L002_R1_001.good.fq,./67_S11_L003_R1_001.good.fq,./67_S11_L004_R1_001.good.fq \
	-2 ./67_S11_L001_R2_001.good.fq,./67_S11_L002_R2_001.good.fq,./67_S11_L003_R2_001.good.fq,./67_S11_L004_R2_001.good.fq \
	-S ../Alignment/T5.sam

hisat2 -p 16 -x $index/Mus_musculus --dta \
	-1 ./68_S12_L001_R1_001.good.fq,./68_S12_L002_R1_001.good.fq,./68_S12_L003_R1_001.good.fq,./68_S12_L004_R1_001.good.fq \
	-2 ./68_S12_L001_R2_001.good.fq,./68_S12_L002_R2_001.good.fq,./68_S12_L003_R2_001.good.fq,./68_S12_L004_R2_001.good.fq \
	-S ../Alignment/C3.sam

hisat2 -p 16 -x $index/Mus_musculus --dta \
	-1 ./69_S6_L001_R1_001.good.fq,./69_S6_L002_R1_001.good.fq,./69_S6_L003_R1_001.good.fq,./69_S6_L004_R1_001.good.fq \
	-2 ./69_S6_L001_R2_001.good.fq,./69_S6_L002_R2_001.good.fq,./69_S6_L003_R2_001.good.fq,./69_S6_L004_R2_001.good.fq \
	-S ../Alignment/C4.sam

hisat2 -p 16 -x $index/Mus_musculus --dta \
	-1 ./70_S5_L001_R1_001.good.fq,./70_S5_L002_R1_001.good.fq,./70_S5_L003_R1_001.good.fq,./70_S5_L004_R1_001.good.fq \
	-2 ./70_S5_L001_R2_001.good.fq,./70_S5_L002_R2_001.good.fq,./70_S5_L003_R2_001.good.fq,./70_S5_L004_R2_001.good.fq \
	-S ../Alignment/T6.sam

hisat2 -p 16 -x $index/Mus_musculus --dta \
	-1 ./71_S9_L001_R1_001.good.fq,./71_S9_L002_R1_001.good.fq,./71_S9_L003_R1_001.good.fq,./71_S9_L004_R1_001.good.fq \
	-2 ./71_S9_L001_R2_001.good.fq,./71_S9_L002_R2_001.good.fq,./71_S9_L003_R2_001.good.fq,./71_S9_L004_R2_001.good.fq \
	-S ../Alignment/T7.sam

hisat2 -p 16 -x $index/Mus_musculus --dta \
	-1 ./72_S1_L001_R1_001.good.fq,./72_S1_L002_R1_001.good.fq,./72_S1_L003_R1_001.good.fq,./72_S1_L004_R1_001.good.fq \
	-2 ./72_S1_L001_R2_001.good.fq,./72_S1_L002_R2_001.good.fq,./72_S1_L003_R2_001.good.fq,./72_S1_L004_R2_001.good.fq \
	-S ../Alignment/C5.sam

hisat2 -p 16 -x $index/Mus_musculus --dta \
	-1 ./73_S4_L001_R1_001.good.fq,./73_S4_L002_R1_001.good.fq,./73_S4_L003_R1_001.good.fq,./73_S4_L004_R1_001.good.fq \
	-2 ./73_S4_L001_R2_001.good.fq,./73_S4_L002_R2_001.good.fq,./73_S4_L003_R2_001.good.fq,./73_S4_L004_R2_001.good.fq \
	-S ../Alignment/C6.sam

# Sort the resulting SAM files and convert them to BAM files.
cd ../Alignment
samtools sort -@ 16 -o T1.bam T1.sam
samtools sort -@ 16 -o T3.bam T3.sam
samtools sort -@ 16 -o T4.bam T4.sam
samtools sort -@ 16 -o T5.bam T5.sam
samtools sort -@ 16 -o T6.bam T6.sam
samtools sort -@ 16 -o T7.bam T7.sam
samtools sort -@ 16 -o C1.bam C1.sam
samtools sort -@ 16 -o C2.bam C2.sam
samtools sort -@ 16 -o C3.bam C3.sam
samtools sort -@ 16 -o C4.bam C4.sam
samtools sort -@ 16 -o C5.bam C5.sam
samtools sort -@ 16 -o C6.bam C6.sam