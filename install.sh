#!/bin/bash

# Prompt
while true; do
  read -p "Before you install, please check the .env files first before executing this install. Did you do this? (Yn)" yn
  case $yn in
    [Y]* ) break;;
    [Nn]* ) exit;;
    * ) echo "Please State your claim."
  esac
done

# Setup Bedrock
echo "Let's clone bedrock"
git clone git@github.com:roots/bedrock.git ./site && rm -Rf ./site/.git && rm -Rf ./site/.github

# Replace the coposer json

# copy the env file
cp -rf  ./configs/.env ./site/.env
cp -rf ./configs/composer.json ./site/composer.json

theme_dir="./site/web/app/themes/jointsWP"

# clone the theme "JointsWP"
git clone git@github.com:JeremyEnglert/JointsWP.git $theme_dir && rm -Rf $theme_dir/.git

# Build the image
docker-compose build --force-rm --no-cache
docker-compose run wp composer install
docker-compose run wp composer update
docker-compose up -d
