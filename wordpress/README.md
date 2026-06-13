# WordPress on containers

This is my attempt to create a local wordpress development environment based on containers.

## Inspiration

I was inspired by this YouTube video for the most part: https://www.youtube.com/watch?v=kIqWxjDj4IU

## Requirements

- docker/podman
- docker compose/podman-compose
- mkcert

## Included

- Nginx
- PHP
- MySQL
- WordPress
- WP-CLI
- Local SSL certificates with `mkcert`

## Usage

1. Clone this repository.
2. Download the latest WordPress zip file from https://wordpress.org/download/ and unzip it in the `wordpress` folder.
3. Update the `compose.yml` file and `wordpress/wp-config.php` file with your own settings (database name, user, password, etc).

> [!WARNING]
> Rename `wordpress/wp-config-sample.php` to `wordpress/wp-config.php` before you add your own settings on it.

4. Run `mkcert -install` to install the mkcert authority in your system.
5. Run `mkcert wp.local` to create a certificate for the domain `wp.local`.
6. Put the certificate files in the `nginx/certs` folder.

> [!TIP]
> Everywhere you see `wp.local` you can replace it with your own local domain. Just make sure you update the `server_name`
> , the `ssl_certificate` and the `ssl_certificate_key` in the `nginx/default.conf` file accordingly. Also, the `etc/hosts` file (or the equivalent on your OS)
> needs to be updated with your local domain.

7. Create a `mysql` folder inside your project root.
8. After that you can run `docker compose up -d --build` to start the containers and `docker compose down` to stop them.
9. You can now access your WordPress site at `https://wp.local`.
10. You can also access the wp-cli directly using a command like `docker compose run --rm wp user list`.

> [!WARNING]
> Make sure to change `compose.yml` ports from 8080:80 and 8443:443 to 80:80 and 443:443 if you are using Docker with sudo.
> Otherwise, map 8080 to 80 and 8443 to 443 on your system. On Linux, you can do that with:

```bash
iptables -t nat -A OUTPUT -o lo -p tcp --dport 80 -j REDIRECT --to-port 8080
iptables -t nat -A OUTPUT -o lo -p tcp --dport 443 -j REDIRECT --to-port 8443
```

## License

This project is released into the public domain. See the [LICENSE](../LICENSE) file for more information.
