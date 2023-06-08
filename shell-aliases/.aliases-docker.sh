#!/bin/sh

function dhtag() {
  docker tag $1 docker4rwp/$1
}

function dhpush() {
  docker push docker4rwp/$1
}

# https://www.portainer.io/ a web UI for Docker
alias portainer-init="sudo docker volume create portainer_data"
alias portainer-start="sudo docker run -d -p 9000:9000 --name=portainer --restart=unless-stopped -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce"
alias portainer="xdg-open http://localhost:9000"
