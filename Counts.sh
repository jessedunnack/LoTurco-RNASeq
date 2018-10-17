#!/bin/bash
#SBATCH --job-name=Counts
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 16
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mem=100G
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
module load htseq/0.9.1
mkdir ../Counts
gff=/isg/shared/databases/alignerIndex/animal/mus_musculus/Mus_musculus.GRCm38.92.gtf

htseq-count -s reverse -r pos -t gene -t exon -f bam C1.bam $gff > ../Counts/C1.Counts
htseq-count -s reverse -r pos -t gene -t exon -f bam C2.bam $gff > ../Counts/C2.Counts
htseq-count -s reverse -r pos -t gene -t exon -f bam C3.bam $gff > ../Counts/C3.Counts
htseq-count -s reverse -r pos -t gene -t exon -f bam C4.bam $gff > ../Counts/C4.Counts
htseq-count -s reverse -r pos -t gene -t exon -f bam C5.bam $gff > ../Counts/C5.Counts
htseq-count -s reverse -r pos -t gene -t exon -f bam C6.bam $gff > ../Counts/C6.Counts

htseq-count -s reverse -r pos -t gene -t exon -f bam T1.bam $gff > ../Counts/C1.Counts
htseq-count -s reverse -r pos -t gene -t exon -f bam T3.bam $gff > ../Counts/T3.Counts
htseq-count -s reverse -r pos -t gene -t exon -f bam T4.bam $gff > ../Counts/T4.Counts
htseq-count -s reverse -r pos -t gene -t exon -f bam T5.bam $gff > ../Counts/T5.Counts
htseq-count -s reverse -r pos -t gene -t exon -f bam T6.bam $gff > ../Counts/T6.Counts
htseq-count -s reverse -r pos -t gene -t exon -f bam T7.bam $gff > ../Counts/T7.Counts
