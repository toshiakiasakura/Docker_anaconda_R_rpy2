FROM continuumio/anaconda3:2020.11

WORKDIR /workdir
EXPOSE 8888

# jupyter lab extensions. 
RUN conda install -c anaconda -y nodejs && \ 
    conda install -c conda-forge jupyterlab-snippets && \
    conda install -c conda-forge jupyterlab-git -y && \
    jupyter labextension install jupyterlab-plotly@4.14.3 --no-build && \
    jupyter labextension install @jupyterlab/toc --no-build && \
    jupyter labextension install @axlair/jupyterlab_vim --no-build && \
    jupyter lab build

# python package installation. 
RUN pip install --upgrade pip && \
    pip install japanize-matplotlib && \
    pip install plotly && \
    pip install ipynb_path && \
    pip install pymc3


# install R 
RUN apt-get update && \
    apt-get install r-base -y && \ 
    pip install rpy2 && \
    Rscript -e "install.packages(c('dplyr','surveillance'))"


# install vim 
RUN apt-get update && \
    apt-get install -y vim

RUN echo "alias jpt_lab='echo -e \"\nhttp://localhost:8888\n\" && jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token='''" >> /root/.bashrc

