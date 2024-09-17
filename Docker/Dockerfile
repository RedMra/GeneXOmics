# Use Amazon Linux 2
FROM amazonlinux:2

ENV PATH="/root/.local/bin:$PATH"

RUN yum update -y && \
    yum install -y \
    java-11-amazon-corretto \
    python3 \
    unzip \
    wget \
    tar \
    gzip \
    git \
    which \
    && yum clean all

# Install AWS cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

# Install Nextflow
RUN curl -s https://get.nextflow.io | bash && \
    chmod +x nextflow && \
    mv nextflow /usr/local/bin/

# Install FastQC
RUN wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.9.zip && \
    unzip fastqc_v0.11.9.zip && \
    rm fastqc_v0.11.9.zip && \
    chmod +x FastQC/fastqc && \
    mv FastQC /opt/fastqc && \
    ln -s /opt/fastqc/fastqc /usr/local/bin/fastqc

# Install CellRanger
COPY cellranger-8.0.1.tar.gz cellranger-8.0.1.tar.gz

RUN tar -xzvf cellranger-8.0.1.tar.gz && \
    rm cellranger-8.0.1.tar.gz && \
    mv cellranger-8.0.1 /opt/cellranger && \
    ln -s /opt/cellranger/cellranger /usr/local/bin/cellranger

# Install Quilt3
RUN pip3 install --no-cache-dir quilt3

CMD [ "bash" ]
