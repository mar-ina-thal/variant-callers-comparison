STRELKA_VERSION=2.9.10.centos6_x86_64

export CC=/etc/alternatives/cc
export CXX=/etc/alternatives/c++

STRELKA_INSTALL_PATH=/home/marina/opt/strelka-2.9.10.centos6_x86_64
BAM_DIR=/media/marina/marina2TB/BIOFILES2

#configure and install Strelka
../strelka-${STRELKA_VERSION}.release_src/configure --jobs=4 --prefix=$STRELKA_INSTALL_PATH
make -j4 install

#index bed file 
tabix -p bed $BAM_DIR/chromosome11_intervals.bed.gz


# run configuration
$STRELKA_INSTALL_PATH/bin/configureStrelkaGermlineWorkflow.py \
    --exome \
    --callRegions $BAM_DIR/chromosome11_intervals.bed.gz \
    --bam=$BAM_DIR/HG00267.nodup.bam \
    --bam=$BAM_DIR/HG00269.nodup.bam \
    --bam=$BAM_DIR/HG00271.nodup.bam \
    --bam=$BAM_DIR/HG00272.nodup.bam \
    --bam=$BAM_DIR/HG00273.nodup.bam \
    --bam=$BAM_DIR/HG00274.nodup.bam \
    --bam=$BAM_DIR/HG00275.nodup.bam \
    --bam=$BAM_DIR/HG00276.nodup.bam \
    --bam=$BAM_DIR/HG00277.nodup.bam \
    --bam=$BAM_DIR/HG00280.nodup.bam \
    --bam=$BAM_DIR/HG00281.nodup.bam \
    --bam=$BAM_DIR/HG00282.nodup.bam \
    --bam=$BAM_DIR/HG00284.nodup.bam \
    --bam=$BAM_DIR/HG00285.nodup.bam \
    --bam=$BAM_DIR/HG00288.nodup.bam \
    --bam=$BAM_DIR/HG00290.nodup.bam \
    --bam=$BAM_DIR/HG00304.nodup.bam \
    --bam=$BAM_DIR/HG00306.nodup.bam \
    --referenceFasta $BAM_DIR/chromosome11.fasta \
    --runDir /media/marina/marina2TB/strelka2/germline_exome 



#run the workflow
/media/marina/marina2TB/strelka2/germline_exome/runWorkflow.py -m local -j 24
 


