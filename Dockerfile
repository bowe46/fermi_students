FROM bowe46/matteobalbo-fermitools:latest

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}


USER root
ADD requirements_docker.txt /requirements_docker.txt
RUN pip install  future
RUN pip install -r /requirements_docker.txt
ADD examples $HOME/examples

RUN chown -R ${NB_UID} ${HOME}

USER ${NB_USER}
WORKDIR /home/jovyan/examples
