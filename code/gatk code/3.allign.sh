for i in {267..306}; do
    RG_TAG=$(samtools view -H HG00$i.chrom11.ILLUMINA.bwa.FIN.exome.bam| grep '^@RG' | head -1)
    echo $RG_TAG
    RG_TAG=$(echo "$RG_TAG" | sed 's/[ \t]/\\t/g')
    #echo $RG_TAG
    bwa mem -t 6 -M -R $RG_TAG chromosome11.fasta HG00$i.interleaved.fq.gz | samtools sort -O bam -o HG00$i.alligned.sorted.bam
done


