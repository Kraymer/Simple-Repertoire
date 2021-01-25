# Container image that runs your code
FROM kraymer/musescore:3.6

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY .github/convert.sh /convert.sh

# Executes `entrypoint.sh` when the Docker container starts up
ENTRYPOINT ["/convert.sh"]
