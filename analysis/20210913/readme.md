# Description of analysis in 20210913

The directory a phylogenetic analysis OTU 6 the determine its closest neighbors
in the NCBI nt database.

Homologous sequences were selected from NCBI nt with discontinuous Megablast.

These were, renamed with rename.py, aligned with Mafft and a GTRGamma tree was constructed with RAxML.

The commands run are in the file `Tree.sh`

This tree was not used in the paper. 
