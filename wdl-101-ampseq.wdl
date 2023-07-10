version 1.0

workflow ampseq_bbmerge {
  input {
      String path_to_fq 
      String pattern_fw = "*_L001_R1_001.fastq.gz"
      String pattern_rv = "*_L001_R2_001.fastq.gz"
      Int read_maxlength = 200
      Int pairread_minlength = 100
      Int merge_minlength = 100
      File barcodes_file = "/Users/jorgeamaya/Desktop/Broad_Test/amplicon_decontamination_pipeline/Data/barcodes.fasta"
      File pr1 = "/Users/jorgeamaya/Desktop/Broad_Test/amplicon_decontamination_pipeline/Data/primers_fw.fasta"
      File pr2 = "/Users/jorgeamaya/Desktop/Broad_Test/amplicon_decontamination_pipeline/Data/primers_rv.fasta"
      String Class = "parasite"
      String maxEE = "5,5"
      String trimRight = "0,0"
      Int minLen = 30
      String truncQ = "5,5"
      String matchIDs = "0"
      Int max_consist = 10
      Float omegaA = 0.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001
      String saveRdata = ""
      Int justConcatenate = 0
      Int maxMismatch = 0
      Int maxMismatch = 0
      String path_to_DADA2 = "/Users/jorgeamaya/Desktop/Broad_Test/amplicon_decontamination_pipeline/Code"
      String overlap_pr1 = "/Users/jorgeamaya/Desktop/Broad_Test/amplicon_decontamination_pipeline/Data/primers_overlap_fw.fasta"
      String overlap_pr2 = "/Users/jorgeamaya/Desktop/Broad_Test/amplicon_decontamination_pipeline/Data/primers_overlap_rv.fasta"
      String reference = "/Users/jorgeamaya/Desktop/Broad_Test/amplicon_decontamination_pipeline/Data/pf3d7_ref_updated_v4.fasta"
      String adjust_mode = "absolute"
      String path_to_snv = "/Users/jorgeamaya/Desktop/Broad_Test/amplicon_decontamination_pipeline/Data/snv_filters.txt"
      String no_ref = "False"
      String reference2 = "/Users/jorgeamaya/Desktop/Broad_Test/amplicon_decontamination_pipeline/Data/pfdd2_ref_updated_v3.fasta"
      String strain = "3D7"
      String strain2 = "DD2"
      String polyN = "5"
      String min_reads = "0"
      String min_samples = "0"
      String max_snv_dist = "-1"
      String max_indel_dist = "-1"
      String include_failed = "False"
      String exclude_bimeras = "False"
      String amp_mask = "None"
      String verbose = "False"
  }
  call ampseq_bbmerge_process {
    input:
      path_to_fq = path_to_fq,
      pattern_fw = pattern_fw,
      pattern_rv = pattern_rv,
      read_maxlength = read_maxlength,
      pairread_minlength = pairread_minlength,
      merge_minlength = merge_minlength,
      barcodes_file = barcodes_file,
      pr1 = pr1,
      pr2 = pr2,
      Class = Class,
      maxEE = maxEE,
      trimRight = trimRight,
      minLen = minLen,
      truncQ = truncQ,
      matchIDs = matchIDs,
      max_consist = max_consist,
      omegaA = omegaA,
      saveRdata = saveRdata,
      justConcatenate = justConcatenate,
      maxMismatch = maxMismatch,
      maxMismatch = maxMismatch,
      path_to_DADA2 = path_to_DADA2,
      overlap_pr1 = overlap_pr1,
      overlap_pr2 = overlap_pr2,
      reference = reference,
      adjust_mode = adjust_mode,
      path_to_snv = path_to_snv,
      no_ref = no_ref,
      reference2 = reference2,
      strain = strain,
      strain2 = strain2,
      polyN = polyN,
      min_reads = min_reads,
      min_samples = min_samples,
      max_snv_dist = max_snv_dist,
      max_indel_dist = max_indel_dist,
      include_failed = include_failed,
      exclude_bimeras = exclude_bimeras,
      amp_mask = amp_mask,
      verbose = verbose
  }
  output {
    File stdout_string = ampseq_bbmerge_process.ampseq_bbmerge_process
  }
}

task ampseq_bbmerge_process {
  input {
	  String path_to_fq #= "gs://fc-6c62a345-db17-4e9f-acd2-38a0f624eb9b/2023_07_07_MiSeq_Barcoding3/"
	  String pattern_fw = "*_L001_R1_001.fastq.gz"
	  String pattern_rv = "*_L001_R2_001.fastq.gz"
	  Int read_maxlength = 200
	  Int pairread_minlength = 100
	  Int merge_minlength = 100
	  File barcodes_file = "/Users/jorgeamaya/Desktop/Broad_Test/amplicon_decontamination_pipeline/Data/barcodes.fasta"
	  File pr1 = "/Users/jorgeamaya/Desktop/Broad_Test/amplicon_decontamination_pipeline/Data/primers_fw.fasta"
	  File pr2 = "/Users/jorgeamaya/Desktop/Broad_Test/amplicon_decontamination_pipeline/Data/primers_rv.fasta"
	  String Class = "parasite"
	  String maxEE = "5,5"
	  String trimRight = "0,0"
	  Int minLen = 30
	  String truncQ = "5,5"
	  String matchIDs = "0"
	  Int max_consist = 10
    Float omegaA = 0.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001
	  String saveRdata = ""
	  Int justConcatenate = 0
	  Int maxMismatch = 0
	  Int maxMismatch = 0
	  String path_to_DADA2 = "/Users/jorgeamaya/Desktop/Broad_Test/amplicon_decontamination_pipeline/Code"
	  String overlap_pr1 = "/Users/jorgeamaya/Desktop/Broad_Test/amplicon_decontamination_pipeline/Data/primers_overlap_fw.fasta"
	  String overlap_pr2 = "/Users/jorgeamaya/Desktop/Broad_Test/amplicon_decontamination_pipeline/Data/primers_overlap_rv.fasta"
	  String reference = "/Users/jorgeamaya/Desktop/Broad_Test/amplicon_decontamination_pipeline/Data/pf3d7_ref_updated_v4.fasta"
	  String adjust_mode = "absolute"
	  String path_to_snv = "/Users/jorgeamaya/Desktop/Broad_Test/amplicon_decontamination_pipeline/Data/snv_filters.txt"
	  String no_ref = "False"
	  String reference2 = "/Users/jorgeamaya/Desktop/Broad_Test/amplicon_decontamination_pipeline/Data/pfdd2_ref_updated_v3.fasta"
	  String strain = "3D7"
	  String strain2 = "DD2"
	  String polyN = "5"
	  String min_reads = "0"
	  String min_samples = "0"
	  String max_snv_dist = "-1"
	  String max_indel_dist = "-1"
	  String include_failed = "False"
	  String exclude_bimeras = "False"
	  String amp_mask = "None"
	  String verbose = "False"
  }

  Map[String, String] in_map ={
    "path_to_fq": path_to_fq,
    "pattern_fw": pattern_fw,
    "pattern_rv": pattern_rv,
    "read_maxlength": read_maxlength,
    "pairread_minlength": pairread_minlength,
    "merge_minlength": merge_minlength,
    "barcodes_file": barcodes_file,
    "pr1": pr1,
    "pr2": pr2,
    "Class": Class,
    "maxEE": maxEE,
    "trimRight": trimRight,
    "minLen": minLen,
    "truncQ": truncQ,
    "matchIDs": matchIDs,
    "max_consist": max_consist,
    "omegaA": omegaA,
    "saveRdata": saveRdata,
    "justConcatenate": justConcatenate,
    "maxMismatch": maxMismatch,
    "maxMismatch": maxMismatch,
    "path_to_DADA2": path_to_DADA2,
    "overlap_pr1": overlap_pr1,
    "overlap_pr2": overlap_pr2,
    "reference": reference,
    "adjust_mode": adjust_mode,
    "path_to_snv": path_to_snv,
    "no_ref": no_ref,
    "reference2": reference2,
    "strain": strain,
    "strain2": strain2,
    "polyN": polyN,
    "min_reads": min_reads,
    "min_samples": min_samples,
    "max_snv_dist": max_snv_dist,
    "max_indel_dist": max_indel_dist,
    "include_failed": include_failed,
    "exclude_bimeras": exclude_bimeras,
    "amp_mask": amp_mask,
    "verbose": verbose
  }
  command <<<
    gsutil -m rsync -er ~{path_to_fq} fq_dir/
    python Code/Amplicon_TerraPipeline.py --config ~{write_json(in_map)} --overlap_reads > stdout_string.txt
  >>>
  output {
    File config_MiSeq = write_json(in_map)
    File ampseq_bbmerge_process = "stdout_string.txt"
  }
  runtime {
    cpu: 1
    memory: "1 GiB"
    disks: "local-disk 10 HDD"
    bootDiskSizeGb: 10
    preemptible: 3
    maxRetries: 1
    docker: 'jorgeamaya/ci_barcode_terra:v1'
  }
}
