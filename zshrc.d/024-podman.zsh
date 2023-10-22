if command -v podman 1>/dev/null 2>&1; then 
    alias docker=podman
fi

if command -v podman-compose 1>/dev/null 2>&1; then 
    alias docker-compose=podman-compose
fi
