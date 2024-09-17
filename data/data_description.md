# Data Description for CRISPR Screening Experiment

Source dataset from 10xGenomics: [1k A375 Cells Transduced with Non-Target and Target sgRNA, Chromium GEM-X Single Cell 5' Single Cell Immune Profiling dataset analyzed using Cell Ranger 8.0.0](https://www.10xgenomics.com/datasets/1k-CRISPR-5p-gemx).


This dataset involves 1K A375 cells, a human cell line derived from malignant melanoma cells, which were transduced with single guide RNAs (either non-targeting or Rab1a sgRNA). These cells stably express dCas9 for CRISPR perturbations. 


### Overview of the Experiment

Gene Expression and CRISPR libraries were generated using the **Chromium GEM-X Single Cell 5' Reagent Kits v3** and sequenced on an [Illumina NovaSeq6000](https://www.illumina.com/content/dam/illumina/gcs/assembled-assets/marketing-literature/10x-gene-expression-tech-note-m-gl-00777/10x-gene-expression-tech-note-m-gl-00777.pdf). Each cell has approximately 80,000 read pairs.

### CRISPR Screening and Perturb-seq

CRISPR screening allows researchers to investigate how the quantitative expression of certain genes affects cellular phenotypes. With **Chromium Single Cell CRISPR Screening** from 10x Genomics, thousands of CRISPR perturbations can be profiled at single-cell resolution. This comprehensive approach empowers researchers to explore the complete transcriptomic effects of genetic perturbations with higher throughput and resolution than traditional bulk CRISPR screening.

### Sequencing Configuration:
- **Read 1**: 28 cycles
- **i7 index**: 10 cycles
- **i5 index**: 10 cycles
- **Read 2**: 90 cycles



## FASTQ Files Naming Convention

The FASTQ files follow a specific naming pattern that encodes important information about the sequencing run:

<sample_name>_S<sample_number>_L<lane_number>R<read_number><set>.fastq.gz 

### Components of the FASTQ Filename:

1. **`<sample_name>`**: The name of the sample being sequenced. In this case, it could be `gex1` for gene expression or `crispr1` for CRISPR data.
2. **`<S<sample_number>>`**: The sample number as defined in the sequencing run. This number helps differentiate between multiple samples in the same sequencing batch.
3. **`<L<lane_number>>`**: The lane number (`L001`, `L002`, etc.) refers to the specific lane of the flow cell where the sample was sequenced. Multiple lanes may be used for higher coverage.
4. **`<R<read_number>>`**: Indicates the read direction:
   - `R1`: Contains the forward (first) read, which typically includes the barcode and UMI (Unique Molecular Identifier) information.
   - `R2`: Contains the reverse (second) read, which usually holds the cDNA sequence.
5. **`<set>`**: Denotes the index read files (when applicable):
   - `i1` or `i2`: Index 1 and Index 2 files contain the barcode and sample index sequences used to demultiplex the data.

### Example of FASTQ File Names:

- `gex1_S1_L001_R1_001.fastq.gz`: Gene expression data, Sample 1, Lane 1, Read 1 (forward read).
- `gex1_S1_L001_R2_001.fastq.gz`: Gene expression data, Sample 1, Lane 1, Read 2 (reverse read).
- `gex1_S1_L001_i1_001.fastq.gz`: Gene expression data, Sample 1, Lane 1, Index 1.
- `crispr1_S2_L002_R1_001.fastq.gz`: CRISPR guide data, Sample 2, Lane 2, Read 1.
- `crispr1_S2_L002_R2_001.fastq.gz`: CRISPR guide data, Sample 2, Lane 2, Read 2.
- `crispr1_S2_L002_i1_001.fastq.gz`: CRISPR guide data, Sample 2, Lane 2, Index 1.

## Additional Files

- **`multi_config.csv`**: This file specifies the input paths, libraries, and other configurations for the Cell Ranger Multi pipeline. It is used to define the libraries being analyzed (Gene Expression, CRISPR, etc.) and the corresponding FASTQ file locations.
- **`<reference_genome>`**: A folder containing the reference genome to which the reads will be aligned during the pipeline execution.


## Web Summary File

As part of the analysis, a **Web Summary File** is generated. This file provides a summary of key metrics from the single-cell RNA-seq and CRISPR analysis, such as sequencing depth, barcode counts, and sample quality. The summary can be viewed in a web browser for easy interpretation.

- The **Web Summary File** is located at: `results/outs/per_sample_outs/sample_output/web_summary.html`.
- For more details on how to interpret the metrics in this file, refer to the [Web Summary Technical Note](https://cdn.10xgenomics.com/image/upload/v1706742309/support-documents/CG000729_TechNote_WebSummary_Chromium_FixedRNAProfiling_RevA.pdf).

