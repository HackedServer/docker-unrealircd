# docker-unrealircd
Docker image for [UnrealIRCd 6](https://www.unrealircd.org/), automatically built and published to GHCR whenever a new stable release is available.

## Image

```
ghcr.io/hackedserver/docker-unrealircd:latest
```

## Usage

### docker run

```bash
docker run -d \
  -p 6667:6667 \
  -p 6697:6697 \
  -v ./unrealircd.conf:/home/ircd/unrealircd/conf/unrealircd.conf:ro \
  ghcr.io/hackedserver/docker-unrealircd:latest
```

### docker-compose

See [docker-compose.example.yml](docker-compose.example.yml).

### Running other commands

The entrypoint is `./unrealircd`, so you can pass any subcommand:

```bash
docker run --rm -it ghcr.io/hackedserver/docker-unrealircd:latest help
docker run --rm -it ghcr.io/hackedserver/docker-unrealircd:latest version
docker run --rm -it ghcr.io/hackedserver/docker-unrealircd:latest rehash
docker run --rm -it ghcr.io/hackedserver/docker-unrealircd:latest reloadtls
```

## Configuration

Mount your config file to `/home/ircd/unrealircd/conf/unrealircd.conf`.

For a starting point, see the [official example config](https://github.com/unrealircd/unrealircd/blob/unreal60_dev/doc/conf/examples/example.conf).
