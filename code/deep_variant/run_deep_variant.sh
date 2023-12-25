PWD=/home/marina
INPUT_DIR=${PWD}/input-data
BIN_VERSION="1.5.0"

for i in {288,290,304,306}; do
    OUTPUT_DIR="/media/marina/marina2TB1/deep_variant/deep_variant-output$((i))"
    sudo mkdir -p "${OUTPUT_DIR}"

    sudo docker run \
      -v "${INPUT_DIR}":"/input" \
      -v "${OUTPUT_DIR}":"/output" \
      google/deepvariant:"${BIN_VERSION}" \
      /opt/deepvariant/bin/run_deepvariant \
      --model_type=HYBRID_PACBIO_ILLUMINA \
      --ref=/input/chromosome11.fasta \
      --reads=/input/HG00$i.nodup.bam \
      --regions "chr11:60001-135076622"\
      --output_vcf=/output/output.vcf.gz \
      --output_gvcf=/output/output.g.vcf.gz \
      --intermediate_results_dir /output/intermediate_results_dir \

done



