#Define sorted vcf paths
VCF1sort=/home/marina/Desktop/varian_callers_results/results/gatk_final_vcfs/indel.SNP.recalibrated_99.7.vcf.gz
VCF2sort=/home/marina/Desktop/varian_callers_results/results/strelka_final_vcfs/strelka_exome_variants.vcf.gz

##Use bcftools to find intersection of two vcf files
bcftools isec -n=2 -p intersection $VCF1sort $VCF2sort

#Calculate the percentage of intersection
total_sites=$(bcftools view -H $VCF1sort | wc -l)
intersection_sites=$(bcftools view -H intersection/0000.vcf | wc -l)

percentage=$((intersection_sites * 100 / total_sites))
echo "Percentage of intersection: $percentage%"


