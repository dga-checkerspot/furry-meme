#!/usr/bin/env nextflow

params.pacB='s3://pipe.scratch.3/resources/hic/CHK*fastq.gz'



pacb_data = Channel.fromPath(params.pacB)



process jFish {
  memory '256G'
  
  input:
  path pb from pacB_data
  
  output:
  file 'reads.histo' into jellyfishout
  
  """
  jellyfish count -C -m 51 -s 10G -t 48 <(zcat $pb) -o reads.jf
  jellyfish histo -t 48 reads.jf > reads.histo
  
  """
  
 }
