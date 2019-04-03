#!/bin/bash
#array-loop.sh

sample_info=samples.txt

sample_files=($(cut -f 3 "$sample_info"))

for fastq_file in ${sample_files[@]}
do
        results_file="$(basename $fastq_file .fastq)-stats.txt"
        #how could the basename command be changed but still produce the same output?
        echo "fastq_stat $fastq_file > stats/$results_file"
done
