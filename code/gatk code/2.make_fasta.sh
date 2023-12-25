#!/bin/bash

for i in {267..306}; do
  samtools collate -uOn 128 HG00$i.chrom11.ILLUMINA.bwa.FIN.exome.bam | samtools fastq - | gzip > HG00$i.interleaved.fq.gz
done

