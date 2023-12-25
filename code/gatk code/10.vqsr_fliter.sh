export JAVA_OPTS="-Djava.io.tmpdir=/media/marina/marina2TB/BIOFILES2/tmp/"
gatk=/home/marina/Documents/opt/gatk-4.4.0.0/gatk
homeDir=/media/marina/marina2TB/BIOFILES2
dataDir=$homeDir
storeDir=$homeDir


# cd $dataDir

bundle=$homeDir
ref=$homeDir/chromosome11.fasta

echo "Starting SNP VariantRecalibrator"

$gatk --java-options "-Xms4G -Xmx4G -XX:ParallelGCThreads=7" VariantRecalibrator \
  -tranche 100.0 -tranche 99.95 -tranche 99.9 \
  -tranche 99.5 -tranche 99.6 -tranche 99.5 -tranche 99.4 \
  -tranche 99.3 -tranche 99.0 -tranche 98.0 -tranche 97.0 -tranche 90.0 \
  -R $ref \
  -V $dataDir/jointcallcohort.vcf \
  --resource:hapmap,known=false,training=true,truth=true,prior=15.0 $bundle/resources_broad_hg38_v0_hapmap_3.3.hg38.vcf.gz  \
  --resource:omni,known=false,training=true,truth=false,prior=12.0 $bundle/resources_broad_hg38_v0_1000G_omni2.5.hg38.vcf.gz \
  --resource:1000G,known=false,training=true,truth=false,prior=10.0 $bundle/resources_broad_hg38_v0_1000G_phase1.snps.high_confidence.hg38.vcf.gz \
  --resource:dbsnp,known=true,training=false,truth=false,prior=7.0 $bundle/resources_broad_hg38_v0_Homo_sapiens_assembly38.dbsnp138.vcf \
  -an QD -an MQ -an MQRankSum -an ReadPosRankSum -an FS -an SOR -an DP \
  -mode SNP -O $storeDir/jointcallcohort.SNP.recal --tranches-file $storeDir/output.jointcallcohort.SNP.tranches \
  --rscript-file $storeDir/output.jointcallcohort.SNP.plots.R

echo "Starting INDEL VariantRecalibrator"
$gatk --java-options "-Xms4G -Xmx4G -XX:ParallelGCThreads=7" VariantRecalibrator \
  -tranche 100.0 -tranche 99.95 -tranche 99.9 \
  -tranche 99.5 -tranche 99.0 -tranche 97.0 -tranche 96.0 \
  -tranche 95.0 -tranche 94.0 -tranche 93.5 -tranche 93.0 \
  -tranche 92.0 -tranche 91.0 -tranche 90.0 \
  -R $ref \
  -V $dataDir/jointcallcohort.vcf \
  --resource:mills,known=false,training=true,truth=true,prior=12.0 $bundle/resources_broad_hg38_v0_Mills_and_1000G_gold_standard.indels.hg38.vcf.gz \
  --resource:dbsnp,known=true,training=false,truth=false,prior=2.0 $bundle/resources_broad_hg38_v0_Homo_sapiens_assembly38.known_indels.vcf.gz \
  --resource:axiomPoly,known=false,training=true,truth=false,prior=10 $bundle/resources_broad_hg38_v0_Axiom_Exome_Plus.genotypes.all_populations.poly.hg38.vcf.gz \
  -an QD -an MQRankSum -an ReadPosRankSum -an FS -an SOR -an DP \
  -mode INDEL -O $storeDir/jointcallcohort.indel.recal --tranches-file $storeDir/output.jointcallcohort.indel.tranches \
  --rscript-file $storeDir/output.jointcallcohort.indel.plots.R
  
echo "Applying SNP VQSR"  
  
$gatk --java-options "-Xms5G -Xmx5G -XX:ParallelGCThreads=7" ApplyVQSR \
  -V $dataDir/jointcallcohort.vcf\
  --recal-file $storeDir/jointcallcohort.SNP.recal \
  -mode SNP \
  --tranches-file $storeDir/output.jointcallcohort.SNP.tranches \
  --truth-sensitivity-filter-level 99.7 \
  --create-output-variant-index true \
  -O $storeDir/SNP.recalibrated_99.7.vcf.gz

echo "Applying INDEL VQSR"
$gatk --java-options "-Xms5G -Xmx5G -XX:ParallelGCThreads=2" ApplyVQSR \
  -V $storeDir/SNP.recalibrated_99.7.vcf.gz \
  -mode INDEL \
  --recal-file $storeDir/jointcallcohort.indel.recal \
  --tranches-file $storeDir/output.jointcallcohort.indel.tranches \
  --truth-sensitivity-filter-level 99.7 \
  --create-output-variant-index true \
  -O $storeDir/indel.SNP.recalibrated_99.7.vcf.gz
  
echo "DONE"
