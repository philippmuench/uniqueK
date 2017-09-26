# found unique kmers based on background sequence

# installation

```
git clone https://github.com/philippmuench/uniqueK.git
cd uniqueK/src && wget https://github.com/gmarcais/Jellyfish/releases/download/v2.2.6/jellyfish-2.2.6.tar.gz
tar xvzf jellyfish-2.2.6.tar.gz && rm jellyfish-2.2.6.tar.gz
cd jellyfish-2.2.6
./configure
make
make install
cd ../
```

# usuage

```
./unique.sh setA.fasta setB.fasta
```

this will ouptut list of kmers to the files `set_a_specific.txt` and `set_b_specific.txt`

