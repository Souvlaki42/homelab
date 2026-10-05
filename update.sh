#!/usr/bin/env bash
caddy fmt --diff Caddyfile
caddy validate --config Caddyfile --adapter caddyfile
sudo install -m 0644 Caddyfile /etc/caddy/Caddyfile
sudo systemctl reload caddy