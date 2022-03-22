# R Reproducible Workflow Example
Example of a reproducible workflow using R, RStudio Projects, renv, docker, and snakemake

## To build the Docker image from the dockerfile

cd to container-test folder

sudo docker build --rm --force-rm --tag dwietsma/container-test:first-tag .

## To push to docker hub

create 'dwietsma/container-test' repo on dockerhub 

cat ./config/docker-password.txt | docker login --username dwietsma --password-stdin
* note that ./config/docker-password.txt is not tracked in git, create if needed

docker push dwietsma/container-test:first-tag

## To run container
docker run -it --rm --name=test dwietsma/container-test:first-tag bash

## Create singularity image from image on dockerhub

This will pull the docker image from DockerHub and build it as a singularity image locally

singularity build container-test.simg docker://dwietsma/container-test:first-tag


## To run project
snakemake --use-singularity
