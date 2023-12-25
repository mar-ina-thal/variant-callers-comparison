export JAVA_OPTS="-Djava.io.tmpdir=/media/marina/marina2TB/BIOFILES2/tmp/"


for i in {267..306}; do
    /home/marina/Documents/opt/gatk-4.4.0.0/gatk AnalyzeCovariates  -bqsr HG00$i.recal_data.table -plots HG00$i.AnalyzeCovariates.pdf 

done

   
