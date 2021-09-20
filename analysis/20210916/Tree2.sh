# Construction of Taxonomic Tree

# Download alignment file from Hajek et al. (2018)
wget https://onlinelibrary.wiley.com/action/downloadSupplement?doi=10.1111%2Fjeu.12475&file=jeu12475-sup-0001-FigS1.fas

# Add OTU6 to alignment file in Atom text editor

# remove gaps to create unaligned file in Atom text editor

# align with MAFFT v7.487
mafft --maxiterate 1000 --globalpair jeu12475-sup-0001-figs1_otu6.fasta > jeu12475-sup-0001-figs1_otu6_aligned.fasta

# Trim reads to OTU6 region in Geneious v 2021.2.2

# Apply trimAl version 1.2rev59l to remove uninformative Sites
trimal -in V4_region.fasta -out V4_region_trimmed.fasta -automated1

# build ML GTR GAmma Tree with RAxML version 8.2.10
raxmlHPC-PTHREADS-AVX2 -T 4 -s V4_region_trimmed_1.fasta  -m GTRGAMMA -n T2 -f a -x 123 -N autoMRE -p 456

# visualize tree in Geneious v 2021.2.2, root tree, color nodes and export as PDF
