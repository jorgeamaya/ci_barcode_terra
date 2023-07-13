version 1.0

workflow amplicon_decontamination_detect {
	input {
		String path_to_fq 
		String pattern_fw = "*_L001_R1_001.fastq.gz"
		String pattern_rv = "*_L001_R2_001.fastq.gz"
		Int read_maxlength = 200
		Int pairread_minlength = 100
		Int merge_minlength = 100
		File barcodes_file
		File pr1 
		File pr2 
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
		File path_to_DADA2
		File overlap_pr1 
		File overlap_pr2 
		File reference
		String adjust_mode = "absolute"
		File path_to_snv 
		String no_ref = "False"
		File reference2 
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
		File stdout_string = ampseq_bbmerge_process.ampseq_bbmerge_process_stdout
		File merge_tar_file = ampseq_bbmerge_process.merge_tar
		File bbmerge_report_file = ampseq_bbmerge_process.bbmergefields_table
		#File bbmerge_absolute_file = ampseq_bbmerge_process.bbmerge_absolute_barplot
		#File bbmerge_percentage_file = ampseq_bbmerge_process.bbmerge_percentage_barplot
		#File bbmerge_discarded_file = ampseq_bbmerge_process.bbmerge_discarded_barplot
	}
}

task ampseq_bbmerge_process {
	input {
		String path_to_fq 
		String pattern_fw = "*_L001_R1_001.fastq.gz"
		String pattern_rv = "*_L001_R2_001.fastq.gz"
		Int read_maxlength = 200
		Int pairread_minlength = 100
		Int merge_minlength = 100
		File barcodes_file
		File pr1 
		File pr2
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
		File path_to_DADA2
		File overlap_pr1 
		File overlap_pr2
		File reference
		String adjust_mode = "absolute"
		File path_to_snv 
		String no_ref = "False"
		File reference2
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

	Map[String, String] in_map = {
		"path_to_fq": "fq_dir",
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
	File config_json = write_json(in_map)
	command <<<
	#set -euxo pipefail
	set -x
	mkdir fq_dir

	gsutil ls ~{path_to_fq}
	gsutil -m cp -r ~{path_to_fq}* fq_dir/

	python /Code/Amplicon_TerraPipeline.py --config ~{config_json} --overlap_reads --meta --repo --adaptor_removal --merge --bbmerge_report
	#Rscript /Code/BBMerge.R Report/Merge/ Report/
	tar -czvf Merge.tar.gz Results/Merge
	find . -type f
	cat Results/stdout.txt
	cat Results/stderr.txt
	>>>
	output {
		File config_MiSeq = config_json
		File ampseq_bbmerge_process_stdout = stdout()
		File ampseq_bbmerge_process_stderr = stderr()
		File rawfastq_files = "Results/Fq_metadata/rawfilelist.tsv"
		File merge_tar = "Merge.tar.gz"
		File bbmergefields_table = "Report/Merge/bbmergefields.tsv"
		#File bbmerge_absolute_barplot = "Report/BBmerge_performance_absolute_report.svg"
		#File bbmerge_percentage_barplot = "Report/BBmerge_performance_percentage_report.svg"
		#File bbmerge_discarded_barplot = "Report/BBmerge_performace_absolute_discarded.svg"	
	}
	runtime {
		cpu_cores: 4
		memory: "1 GiB"
		disks: "local-disk 10 HDD"
		bootDiskSizeGb: 10
		preemptible: 3
		maxRetries: 1
		docker: 'jorgeamaya/ci_barcode_terra:v1'
	}
}
