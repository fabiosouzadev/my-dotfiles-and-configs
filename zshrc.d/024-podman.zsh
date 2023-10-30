alias "podman"="sudo podman" 
if command -v podman 1>/dev/null 2>&1; then 
    alias docker="sudo podman"
fi

if command -v podman-compose 1>/dev/null 2>&1; then 
    alias docker-compose="podman-compose"
fi


export KIND_EXPERIMENTAL_PROVIDER=podman
export DOCKER_HOST=unix:///run/podman/podman.sock
