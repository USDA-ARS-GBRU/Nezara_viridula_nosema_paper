# Script to align and create ML tree for OTU_6 and related sequences found in NCBI-nt

python rename.py > OTU6_and_similar_clean.fasta
mafft --maxiterate 1000 --globalpair OTU6_and_similar_clean.fasta > OTU6_and_similar_aligned.fasta
raxmlHPC-PTHREADS-AVX2 -T 4 -s OTU6_and_similar_aligned.fasta  -m GTRGAMMA -n T1 -f a -x 123 -N autoMRE -p 456
