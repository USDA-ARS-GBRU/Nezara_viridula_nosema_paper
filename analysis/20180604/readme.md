
# Description of analysis in 20180604

The directory 20180604 contains an analysis of the amplicon sequencing data
for for the 8 insects that V4 amplicon sequencing was done on.

One tissue type (egg, ovary, spermatheca, or fat body) was taken from 4 spotted and 4 non-spotted individuals.

The data was compositional count data so it was transformed using the centered log ratio approach of Atchison (1986).  The centered log ratio reports the ln(OTU/geometric mean of all OTUS)  

OTU 6, corresponding to _Nosema maddoxi_ was analyzed to look at differences in
the relative abundance in tissues of spotted and unspotted insects.

The R markdown notebook can also be viewed on [rpubs](https://rpubs.com/arivers/N_viridula)
