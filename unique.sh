#!/bin/bash

# wrapper for jellyfish to output set of fasta-file-specific kmers 
# that are not present in a backgrout fasta-file
# input: two fasta files. each fasta file will be used as background
# for the other set
# $1 fasta file for set a, e.g. plastmid.fasta
# $2 fasta file for set b, e.g. chromosome.fasta

kmer_size=6

# get kmer binary
echo "calculate kmers"
src/jellyfish-2.2.6/bin/jellyfish count -m $kmer_size \
  -s 100M -C $1 -o set_a -t 4 > /dev/null
src/jellyfish-2.2.6/bin/jellyfish count -m $kmer_size \
  -s 100M -C $2 -o set_b -t 4 > /dev/null

# found plasmid unique
echo "extract set a abundant kmers"
src/jellyfish-2.2.6/bin/jellyfish dump set_b -c | awk '{print $1}' | \
  sort --parallel=4 -S 50% > set_b_all.csv 

src/jellyfish-2.2.6/bin/jellyfish dump set_a -c --lower-count 500 | \
  awk '{print $1}' | \
  sort  --parallel=4 -S 50% > set_a_high_abundant.csv

# found chr unique
echo "extract set b abundant kmers"
src/jellyfish-2.2.6/bin/jellyfish dump set_b -c --lower-count 500 | \
  awk '{print $1}' | sort  --parallel=4 -S 50% > set_b_high_abundant.csv 
src/jellyfish-2.2.6/bin/jellyfish dump set_a -c  | awk '{print $1}' | \
  sort --parallel=4 -S 50%  > set_a_all.csv

# get unique kmers of list
echo "found set a specific kmers"
diff --new-line-format="" --unchanged-line-format="" \
  set_a_high_abundant.csv set_b_all.csv > set_a_specific.txt
echo "found set b specific kmers"
diff --new-line-format="" --unchanged-line-format=""  \
  set_b_high_abundant.csv set_a_all.csv > set_b_specific.txt
