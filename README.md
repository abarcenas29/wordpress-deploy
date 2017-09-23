# Wordpress Docker Deploy

This repo lets you deploy a wordpress application via docker using roots.io's bedrock.

# Features

_**Bedrock**_

It makes the wordpress more of an Application than a CMS. It uses composer to manage themes and plugins. Uses _dotenv_ files to manage your immediate settings. And using wp-cli for administrative tasks using the command line.

Official Website: [roots.io/Bedrock](https://roots.io/bedrock/)

# Requirements

* Docker (docker-compose)

# Setup

Before running the docker containers you need to edit some of the files in the `/config` folder.

## Edit ENV Files

In the `./config` edit the `.env` and change the following configs. Do not use the same config when deploying your container for production.

## Edit the site.local.conf

The wp wordpress docker container is already build with `nginx`. `site.local.conf` contains the configuration needed to load the site to be accessed. Edit the `server_name` line in the config file to your domain.

_Note:_ the config file is mainly for development purpose for now.

_To Do:_ Create a SSL / multi setting file for central nginx docker setup.

## Edit the composer.json

If you want to add the necessary WP plugins for the bedrock in the `require` object.

## Edit `docker-compose.yml`

Edit the `environment` variable and change the `MYSQL` settings. The `MYSQL_DATABASE`, `MYSQL_USER`, `MYSQL_PASSWORD` must match the DB settings in your `.env` file.

## Edit `./install.sh`

If you want to change the boilerplate theme, edit line 26 of the `./install.sh`

# Installation

Run the `./install.sh` bash script. Visit the site you setup in the nginx config file in your browser.
