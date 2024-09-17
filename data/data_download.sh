#!/bin/bash

# data_download.sh
# Script to download the dataset files from 10x Genomics CRISPR experiment and extract the FASTQ files
# Source: https://www.10xgenomics.com/datasets/1k-CRISPR-5p-gemx
# 1k A375 Cells Transduced with Non-Target and Target sgRNA, Chromium GEM-X Single Cell 5'
# Single Cell Immune Profiling dataset analyzed using Cell Ranger 8.0.0

echo "Starting the download of dataset files from 10x Genomics..."

# Download the FASTQ files
wget https://cf.10xgenomics.com/samples/cell-vdj/8.0.0/1k_CRISPR_5p_gemx_Multiplex/1k_CRISPR_5p_gemx_Multiplex_fastqs.tar

# Download the configuration CSV
wget https://cf.10xgenomics.com/samples/cell-vdj/8.0.0/1k_CRISPR_5p_gemx_Multiplex/1k_CRISPR_5p_gemx_Multiplex_config.csv

# Download the count feature reference CSV
wget https://cf.10xgenomics.com/samples/cell-vdj/8.0.0/1k_CRISPR_5p_gemx_Multiplex/1k_CRISPR_5p_gemx_Multiplex_count_feature_reference.csv

echo "Download complete."

# Extract the FASTQ files from the tar archive
echo "Extracting the FASTQ files from 1k_CRISPR_5p_gemx_Multiplex_fastqs.tar..."
tar -xvf 1k_CRISPR_5p_gemx_Multiplex_fastqs.tar

echo "Extraction complete."

# Brief description of the dataset
echo "
Dataset Overview:
1K A375 cells, a human cell line derived from malignant melanoma cells stably expressing dCas9, were transduced with single guides (either non-targeting or Rab1a sgRNA).

Gene Expression and CRISPR libraries were generated using the Chromium GEM-X Single Cell 5' Reagent Kits v3 and sequenced on an Illumina NovaSeq6000. Each cell contains approximately 80,000 read pairs.

The Cell Ranger multi pipeline (v8.0.0) was used to analyze the libraries.
"

echo "Data downloaded and extracted. Ready for processing!"
