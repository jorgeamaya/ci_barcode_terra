FROM condaforge/mambaforge:22.9.0-1

RUN conda config \
    --add channels defaults \
    --add channels bioconda \
    --add channels conda-forge; \
    conda install -y pandas; \
    conda install -y biopython; \
    conda install -y bbmap; \
    conda install -y trim-galore; \
    conda install -y cutadapt

COPY master.sh . 
COPY Code Code 
COPY config_MiSeq.json . 
COPY Data Data

ENTRYPOINT ["/master.sh"]
