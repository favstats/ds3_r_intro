FROM rocker/binder:4.1.2

## Declares build arguments
ARG NB_USER
ARG NB_UID

COPY --chown=${NB_USER} . ${HOME}

ENV DEBIAN_FRONTEND=noninteractive
USER root
RUN echo "Checking for 'docker/apt.txt'..." \
        ; if test -f "docker/apt.txt" ; then \
        apt-get update --fix-missing > /dev/null\
        && xargs -a docker/apt.txt apt-get install --yes \
        && apt-get clean > /dev/null \
        && rm -rf /var/lib/apt/lists/* \
        ; fi
USER ${NB_USER}

## Run an install.R script, if it exists.
RUN if [ -f docker/install.R ]; then R --quiet -f docker/install.R; fi