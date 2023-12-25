for i in {267..306}; do
    java -jar /home/marina/opt/picard.jar MarkDuplicates -I HG00$i.alligned.sorted.bam -O HG00$i.nodup.bam -M HG00$i.metrics.txt
done
