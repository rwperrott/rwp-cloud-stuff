
# requires variables:
# DOCKER_HUB_USER

# Tag and push a local named image to my repo on docker.
dhpush() {
  docker tag "$1" "$DOCKER_HUB_USER"/"$1"
  docker push "$DOCKER_HUB_USER"/"$1"
}

# https://www.portainer.io/ a web UI for Docker
alias portainer-init='sudo docker volume create portainer_data'
alias portainer-start='"sudo docker run -d -p 9000:9000 --name=portainer --restart=unless-stopped -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce'
alias portainer='xdg-open http://localhost:9000'
