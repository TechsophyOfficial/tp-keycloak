
# awgment-keycloak

awgment-keycloak

## Docker build and run
docker build . -t awgment/keycloak

set values in docker.env files as per your environment

docker run --rm -it  --env-file docker.env awgment/keycloak
