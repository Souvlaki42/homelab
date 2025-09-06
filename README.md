# WordPress Docker Test

This is my attempt to create a docker compose file for a local wordpress development environment.

## Inspiration

I was inspired by this YouTube video for the most part: https://www.youtube.com/watch?v=kIqWxjDj4IU

## Requirements

- docker
- docker-compose
- mkcert

## Included

- Nginx
- PHP
- MySQL
- WordPress
- WP-CLI
- Local SSL certificates with `mkcert`
- Tested with WordPress 6.6.2, PHP 7.4, Docker 27.2.0, Docker Compose 2.29.2

## Usage

1. Clone this repository: `git clone https://github.com/ilias-sp/wordpress-docker.test.git`.
2. Download the latest WordPress zip file from https://wordpress.org/download/ and unzip it in the `wordpress` folder.
3. Update the `docker-compose.yml` file and `wordpress/wp-config.php` file with your own settings (database name, user, password, etc).

> [!WARNING]
> Rename `wordpress/wp-config-sample.php` to `wordpress/wp-config.php` before you add your own settings on it.

4. Run `mkcert -install` to install the mkcert authority in your system.
5. Run `mkcert wordpress-docker.test` to create a certificate for the domain `wordpress-docker.test`.
6. Put the certificate files in the `nginx/certs` folder.

> [!TIP]
> Everywhere you see `wordpress-docker.test` you can replace it with your own local domain. Just make sure you update the `server_name`
> , the `ssl_certificate` and the `ssl_certificate_key` in the `nginx/default.conf` file accordingly. Also, the `etc/hosts` file (or the equivalent on your OS)
> needs to be updated with your local domain.

7. Create a `mysql` folder inside your project root.
8. After that you can run `docker-compose up -d --build` to start the containers and `docker-compose down` to stop them.
9. You can now access your WordPress site at `https://wordpress-docker.test`.
10. You can also access the wp-cli directly using a command like `docker-compose run --rm wp user list`.

> [!NOTE]
> If you find any issues with the repository, please open an issue. Also, if you like this repository and want to support me, you can do so by giving me a star on GitHub.

## Unlicense

This project is released into the public domain. See the [UNLICENSE](UNLICENSE) file for more information.
