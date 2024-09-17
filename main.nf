// Pipeline input parameters

params.files = "${projectDir}/data/1k_CRISPR_5p_gemx_fastqs/{crispr,gex}/*.gz"
params.reads = "${projectDir}/data/1k_CRISPR_5p_gemx_Multiplex_config.csv"
params.outdir_fastqc = "${quiltprefix}${projectDir}/results/fastqc${quiltpkg}"
params.outdir_cellranger = "${quiltprefix}${projectDir}/results/cellranger${quiltpkg}"

workDir = "${projectDir}/execution/work"

process FASTQC {
    tag "FASTQC on $files.simpleName"
    publishDir params.outdir_fastqc, mode:'copy'

    input:
    path files

    output:
    path "${files.simpleName}_fastqc.html", emit: fastqc_html
    path "${files.simpleName}_fastqc.zip", emit: fastqc_zip

    script:
    """
    fastqc -o . -f fastq -q ${files}
    """
}

process CELLRANGER_MULTI {
    tag "CELLRANGER"
    publishDir params.outdir_cellranger, mode:'copy'

    input:
    path file

    output:
    path 'results'

    script:
    """
    cellranger multi --id=results --csv=${file} --localcores=16 --localmem=64
    """
}

workflow {
    Channel.fromPath(params.files, checkIfExists: true).set{ read_files_ch }
    Channel.fromPath(params.reads, checkIfExists: true).set{ cellrange_csv_ch }

    fastqc_ch = FASTQC(read_files_ch)
    cellrange_cg = CELLRANGER_MULTI(cellrange_csv_ch)
}