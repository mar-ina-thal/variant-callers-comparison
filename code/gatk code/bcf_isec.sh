VCF1=/media/marina/marina2TB/BIOFILES2/results/indel.SNP.recalibrated_99.7.vcf.gz
VCF2=/media/marina/marina2TB/strelka2/demo_germline/results/filtered_variants.vcf.gz
 
bcftools isec  -p intersection $VCF1 $VCF2


total_sites=$(bcftools view -H $VCF1 | wc -l)
intersection_sites=$(bcftools view -H intersection/0000.vcf | wc -l)

percentage=$((intersection_sites * 100 / total_sites))
echo "Percentage of intersection: $percentage%"



