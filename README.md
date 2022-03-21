# R Reproducible Workflow Example
Example of a reproducible workflow using R, RStudio Projects, renv, docker, and snakemake

## To build the Docker image from the dockerfile

cd to container-test folder

sudo docker build --rm --force-rm dwietsma/container-test .

docker tag fa4d68d5c724 dwietsma/container-test:initial-tag

## To push to docker hub

create 'dwietsma/container-test' repo on dockerhub 

cat ./config/docker-password.txt | docker login --username dwietsma --password-stdin
* note that ./config/docker-password.txt is not tracked in git, create if needed

docker push dwietsma/container-test:first-tag
