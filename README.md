# Amplicon decontamination with combinatorial indexing
*The first part of the following Jupyter notebook compiles the output of the Malaria Amplicon Decontamination pipeline in a ready-to-read format. Instructions to read each of the plot are provided at the beginning of each cell. The second part of the Notebook provides functionalities to produce custom plots and table with detailed information about each of the processed wells.*

Contamination is a common problem during PCR amplifications. The Amplicon Decontamination Pipeline relies on combinatorial indexing, using i7 and i5 primers, to impute reads to specific wells in an illumina plate. The pipeline will report the percentage of source or percentage of contamination in a given well.  ADD MORE BACKGROUND. PENDING. 

We have reduced to the minimum the number inputs the user will have to insert manually. Code blocks that have to be manually inputed are highlighted with:

### Input code

![Illumina plate](https://www.neb.com/~/media/Catalog/All-Protocols/C1A38CEF02DE4C6E8F70A6D00B1EC9A7/Content/96well_deep_well_plates.jpg)
