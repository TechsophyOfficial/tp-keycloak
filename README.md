
# awgment-keycloak

awgment-keycloak

## Docker build and run and test
docker build . -t awgment/keycloak

set values in docker.env files as per your environment

docker run --rm -it  --env-file docker.env awgment/keycloak
