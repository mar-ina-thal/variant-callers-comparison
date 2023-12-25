export JAVA_OPTS="-Djava.io.tmpdir=/media/marina/marina2TB/BIOFILES2/tmp/"
grep "^chr11" resources_broad_hg38_v0_wgs_calling_regions.hg38.interval_list > chromosome11_intervals.bed

/home/marina/Documents/opt/gatk-4.4.0.0/gatk GenomicsDBImport \
-V HG00267.g.vcf.gz \
-V HG00268.g.vcf.gz \
-V HG00271.g.vcf.gz \
-V HG00272.g.vcf.gz \
-V HG00273.g.vcf.gz \
-V HG00274.g.vcf.gz \
-V HG00275.g.vcf.gz \
-V HG00276.g.vcf.gz \
-V HG00277.g.vcf.gz \
-V HG00278.g.vcf.gz \
-V HG00280.g.vcf.gz \
-V HG00281.g.vcf.gz \
-V HG00282.g.vcf.gz \
-V HG00284.g.vcf.gz \
-V HG00285.g.vcf.gz \
-V HG00288.g.vcf.gz \
-V HG00290.g.vcf.gz \
-V HG00304.g.vcf.gz \
-V HG00306.g.vcf.gz --genomicsdb-workspace-path ./my_database  -L chromosome11_intervals.bed 

