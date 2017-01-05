#!/bin/bash

set -e #Die on error
apt-get update
apt-get install -y apt-transport-https curl wget
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

curl -sL https://deb.nodesource.com/setup_6.x | bash -
apt-get install -y build-essential nodejs nginx yarn
apt-get install -y vim git wget xvfb libxrender-dev libasound2 libdbus-glib-1-2 libgtk2.0-0 bzip2 python supervisor cron

apt-get autoclean
apt-get clean

npm install -g phantomjs-prebuilt



export SLIMERJS_VERSION_F=0.9.6
mkdir -p /srv/var
wget -O /tmp/slimerjs-$SLIMERJS_VERSION_F-linux-x86_64.tar.bz2 http://download.slimerjs.org/releases/$SLIMERJS_VERSION_F/slimerjs-$SLIMERJS_VERSION_F-linux-x86_64.tar.bz2
tar -xjf /tmp/slimerjs-$SLIMERJS_VERSION_F-linux-x86_64.tar.bz2 -C /tmp
rm -f /tmp/slimerjs-$SLIMERJS_VERSION_F-linux-x86_64.tar.bz2
mv /tmp/slimerjs-$SLIMERJS_VERSION_F/ /srv/var/slimerjs
echo '#!/bin/bash\nxvfb-run /srv/var/slimerjs/slimerjs "$@"' > /srv/var/slimerjs/slimerjs.sh
chmod 755 /srv/var/slimerjs/slimerjs.sh
ln -s /srv/var/slimerjs/slimerjs.sh /usr/bin/slimerjs

mkdir -p /var/www
chown -R www-data:www-data /var/www