#!/usr/bin/env nextflow


pacB='s3://wgs.algae.hifi/30-536540905/rawdata/fastX/CHK22.subreads.fastq.gz'


process jFish {
  memory '128G'
  
  input:
  path pb from pacB
  
  output:
  file 'reads.histo' into jellyfishout
  
  """
  jellyfish count -C -m 51 -s 10G -t 48 <(zcat $pb) -o reads.jf
  jellyfish histo -t 48 reads.jf > reads.histo
  
  """
  
 }
