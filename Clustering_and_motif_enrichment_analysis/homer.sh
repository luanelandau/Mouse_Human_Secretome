#!/bin/bash

#SM_clusters/SM_cluster*.txt

for gene_list in SM_clusters/SM_cluster*.txt; do
    cluster=$(basename "$gene_list" .txt)

    echo "Running HOMER promoter motif analysis for $cluster..."
    findMotifs.pl "$gene_list" mouse "SM_clusters/homer_results_${cluster}_promoter/" \
        -start -400 -end 100 \
        -len 8,10,12 \
        -p 4

    echo "Running HOMER RNA motif analysis for $cluster..."
    findMotifs.pl "$gene_list" mouse "SM_clusters/homer_results_${cluster}_rna/" \
        -rna -len 8 \
        -p 4
done
