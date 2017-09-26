# fast detection of unique kmers in fasta file based on background fasta file

# installation

```
git clone https://github.com/philippmuench/uniqueK.git
cd uniqueK && mkdir src && cd src
wget https://github.com/gmarcais/Jellyfish/releases/download/v2.2.6/jellyfish-2.2.6.tar.gz
tar xvzf jellyfish-2.2.6.tar.gz && rm jellyfish-2.2.6.tar.gz
cd jellyfish-2.2.6 && ./configure && make
sudo make install
cd ../../
```

# usuage

```
./uniqueK set_a.fasta set_b.fasta
```

this will ouptut list of kmers to the files `set_a_specific.txt` and `set_b_specific.txt`
