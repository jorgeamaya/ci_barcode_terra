version 1.0

workflow ampseq_bbmerge {
  input {
    File config_MiSeq
  }
  call ampseq_bbmerge_process {
    input:
      config_MiSeq = config_MiSeq 
  }
}

task ampseq_bbmerge_process {
  input {
    File config_MiSeq
  }
  command <<<
    ./master.sh
  >>>
  runtime {
    docker: 'jorgeamaya/ci_barcode_terra'
  }
}
