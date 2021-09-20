#!/usr/local/python

with open("OTU6_and_similar.fasta", "r") as fastafile:
    for line in fastafile:
        if line.startswith(">"):
            ll = line.strip().split(":")[0]
            print(ll)
        else:
            print(line.strip())
