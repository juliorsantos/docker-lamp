# Apache Server + PHP 7.3 + MySQL 8
I did it to save the time of those who don't have time.

This stack includes:
 - Apache 2
 - PHP 7.3 with exts
	 - GD, PDO (mysql, pgsql, mysqli), zip, intl, xdebug, pecl imagick
 - MySQL 8
 - Adminer (latest version)

# How to easily run
 1. Clone this repo `git clone https://github.com/juliorodx/docker-a2php73.git && cd docker-a2php73` 
 2. Create www and data folders. `mkdir -p www data`
 3. Run `docker network create --driver bridge webserver || true` (use true, to avoid warnings, if it exists)
 4. Now, easily run `docker-compose up -d` 
 5. Check if it is running `docker ps`, open your browser and be happy :)

### Notes
This setup is not using a `.env` file.

## Author
[@juliorodx](https://github.com/juliorodx)

Let's contribute, open your nice pull request!