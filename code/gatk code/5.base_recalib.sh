for i in {267..306}; do
    /home/marina/Documents/opt/gatk-4.4.0.0/gatk BaseRecalibrator -I HG00$i.nodup.bam -R chromosome11.fasta -O HG00$i.recal_data.table --known-sites resources_broad_hg38_v0_Mills_and_1000G_gold_standard.indels.hg38.vcf.gz --known-sites resources_broad_hg38_v0_Homo_sapiens_assembly38.known_indels.vcf.gz --known-sites /media/marina/marina2TB/BIOFILES2/resources_broad_hg38_v0_Homo_sapiens_assembly38.dbsnp138.vcf --known-sites resources_broad_hg38_v0_1000G_phase1.snps.high_confidence.hg38.vcf.gz\

done
