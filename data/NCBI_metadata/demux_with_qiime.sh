# This workflow used fastaq and qiime2 process the data provided my MR DNA for
# deposition in NCBI

# The Demuxed dasta and qual files I was provided from MR DNA could not be
# imported by BBtools. I converted to fastq with fastaq and demuxed with qiime2

# install fastaq if needed
# pip install fastaq

fastaq fasta_to_fastq 041918BEillcus515F-full.fasta \
   041918BEillcus515F-full.qual 041918BEillcus515F-full.fastq

# install qiime2/2021.4 if needed
# wget https://data.qiime2.org/distro/core/qiime2-2021.4-py38-osx-conda.yml
# conda env create -n qiime2-2021.4 --file qiime2-2021.4-py38-osx-conda.yml
# rm qiime2-2021.4-py38-osx-conda.yml

qiime tools import \
  --type MultiplexedSingleEndBarcodeInSequence \
  --input-path 041918BEillcus515F-full.fastq.gz \
  --output-path multiplexed-seqs.qza

qiime cutadapt demux-single \
  --i-seqs multiplexed-seqs.qza \
  --m-barcodes-file ../fasta-qual-mapping-files/041918BEillcus515F-mapping2.txt \
  --m-barcodes-column BarcodeSequence \
  --p-error-rate 0 \
  --o-per-sample-sequences demultiplexed-seqs.qza \
  --o-untrimmed-sequences untrimmed.qza \
  --verbose

qiime cutadapt trim-single \
  --i-demultiplexed-sequences demultiplexed-seqs.qza \
  --p-front GGTGYCAGCMGCCGCGGTA \
  --p-error-rate 0 \
  --o-trimmed-sequences trimmed-seqs.qza \
  --verbose

qiime demux summarize \
  --i-data trimmed-seqs.qza \
  --o-visualization trimmed-seqs.qzv

qiime tools import \
  --type MultiplexedSingleEndBarcodeInSequence \
  --input-path 041918BEillcus515F-full.fastq.gz \
  --output-path multiplexed-seqs.qza

qiime tools export \
--input-path trimmed-seqs.qza \
--output-path trimmed-seqs
