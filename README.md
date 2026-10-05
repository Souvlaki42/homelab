# Homelab

This is my "homelab" setup, even if in reality they are running on my own computer.

## Setup

- Install [Podman](https://podman.io/docs/installation) or [Docker](https://docs.docker.com/get-started/get-docker/) and their compose plugins system wide.
- Install [Caddy](https://caddyserver.com/docs/install) system wide.
- Let Caddy run [in the background](https://caddyserver.com/docs/running).
- Tell your system to [trust](https://caddyserver.com/docs/command-line#caddy-trust) Caddy's local CA root certificates.
- Runs the apps you want with `docker/podman compose -f compose.yml` passing the Compose files of the services you want to them.

## Services

- [Wordpress 7.0+ (wordpress)](/wordpress/compose.yml)

## License

This project is licensed under [The Unlicense](/LICENSE).
