for i in {267..306}; do
    samtools depth HG00$i.chrom11.ILLUMINA.bwa.FIN.exome.bam |  awk '{sum+=$3; sumsq+=$3*$3} END { print "Average = ",sum/NR; print "Stdev = ",sqrt(sumsq/NR - (sum/NR)**2)}'

done
