for i in {267..306}; do
    /home/marina/Documents/opt/gatk-4.4.0.0/gatk --java-options "-Xmx4g" HaplotypeCaller -R chromosome11.fasta -I HG00$i.nodup.bam -O HG00$i.g.vcf.gz -ERC GVCF
done


