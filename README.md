# R Reproducible Workflow Example
Example of a reproducible workflow using R, RStudio Projects, renv, docker, and snakemake

## Build the Docker image from the dockerfile

cd to container-test folder

You've created a dockerfile and now want to build the image, run this line below

```
sudo docker build --rm --force-rm --tag dwietsma/container-test:third-tag .
```

To run and shell into the Docker container
Optional, just if you want to look around

```
docker run --interactive --rm --entrypoint /bin/bash dwietsma/container-test:third-tag
```
## Push to Dockerhub

Via the Dockerhub website, create a 'dwietsma/container-test' repo

Log into Dockerhub via the command line
```
cat ./config/docker-password.txt | docker login --username xyz --password-stdin
```
* note that ./config/docker-password.txt is not tracked in git, create if needed

Push image to Dockerhub 

```
docker push dwietsma/container-test:third-tag
```

## To run Docker container 

```
docker run -it --rm --name=test dwietsma/container-test:third-tag bash
```

## Run container on HPC with Singulairty

ssh into the HPC

Request HPC resources, so that you're not running operations on the login node

```
interact -n 1 -t 02:00:00 -m 10g
```

n = the # of cores
t = the amount of time
m = memory

First git clone your repo in the filesystem of the HPC

Pull the docker image from DockerHub and build it as a singularity image locally on the HPC

```
singularity build container-test.simg docker://dwietsma/container-test:third-tag
```


Bind with env vars so that the container can access your projects files

```
export SINGULARITY_BINDPATH="/$HOME/data/container-test:/$HOME"
```

Run the singularity container with an interactive shell

```
singularity shell container-test.simg
```

## Run Project

Run R script directly

```
singularity exec container-test.simg Rscript scripts/make-output-01.R
```

Run project with snakemake

```
snakemake --use-singularity
```
