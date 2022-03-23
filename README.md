# R Reproducible Workflow Example
Example of a reproducible workflow using R, RStudio Projects, renv, docker, and snakemake

## To build the Docker image from the dockerfile

cd to container-test folder

```
sudo docker build --rm --force-rm --tag dwietsma/container-test:third-tag .
```

To run and shell into the Docker container

```
docker run --interactive --entrypoint /bin/bash dwietsma/container-test:third-tag
```

Optional, just if you want to look around

```
docker run --interactive --rm --entrypoint /bin/bash dwietsma/container-test:third-tag
```
## To push to docker hub

create 'dwietsma/container-test' repo on dockerhub 

Log into Dockerhub via the command line
```
cat ./config/docker-password.txt | docker login --username dwietsma --password-stdin
```
* note that ./config/docker-password.txt is not tracked in git, create if needed

Push image to Dockerhub 

```
docker push dwietsma/container-test:first-tag
```

## To run Docker container 

```
docker run -it --rm --name=test dwietsma/container-test:first-tag bash
```

## Run container on HPC with Singulairty

Pull the docker image from DockerHub and build it as a singularity image locally on the HPC

```
singularity build container-test.simg docker://dwietsma/container-test:third-tag
```

Request HPC resources, so that you're not running the container on the login node

interact -n 1 -t 01:30:00 -m 4g

n = the # of cores
t = the amount of time
m = memory

Run the singularity container with an interactive shell, assumes you're
cd'ed to the project's root folder

```
singularity shell container-test.simg
```



## R

## To run project
snakemake --use-singularity
