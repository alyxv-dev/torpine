# Torpine - A convenient Tor Guard/Middle Relay

This image enables you to run a tor guard/middle relay in a convenient way.
## Installation
### Quick Installation
```
docker pull kitzune4real/torpine:latest
curl -O https://raw.githubusercontent.com/kitzune4real/torpine/main/config/tor.env
```

## Build

### Quick Build
You can build it yourself with:
```
curl -O https://raw.githubusercontent.com/alyxv-dev/torpine/main/config/tor.env
docker build -t kitzune4real/torpine:latest https://github.com/alyxv-dev/torpine.git#main

docker run --env-file tor.env --name torpine alyxv/torpine:latest
```

The `docker-compose.yaml` from main branch uses a local torpine image name.

### Custom Build
```
git clone https://github.com/kitzune4real/torpine.git
cd torpine
<edit docker-compose.yaml as needed>
<edit docker-compose.yaml build args>
docker compose up -d
```