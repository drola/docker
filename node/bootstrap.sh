#!/bin/bash

set -e #Die on error
apt-get update
apt-get install -y apt-transport-https curl wget
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

curl -sL https://deb.nodesource.com/setup_6.x | bash -
apt-get install -y build-essential nodejs nginx yarn
apt-get autoclean
apt-get clean

npm install -g phantomjs-prebuilt

mkdir -p /var/www
chown -R www-data:www-data /var/www