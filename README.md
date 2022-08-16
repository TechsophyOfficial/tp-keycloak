
# tp-keycloak

tp-keycloak

## Docker build and run
docker build . -t augmnt/keycloak

set values in docker.env files as per your environment

docker run --rm -it  --env-file docker.env augmnt/keycloak