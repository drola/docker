#!/bin/bash
set -e

# Install
apt-get update && apt-get install -y software-properties-common && add-apt-repository -y ppa:webupd8team/java && dpkg --add-architecture i386 && apt-get update
echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
apt-get install -y --force-yes expect git wget libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 python curl oracle-java7-installer
cd /opt && wget --output-document=android-sdk.tgz --quiet http://dl.google.com/android/android-sdk_r24.3.3-linux.tgz && tar xzf android-sdk.tgz && rm -f android-sdk.tgz && chown -R root.root android-sdk-linux

chmod +x /opt/tools/android-accept-licenses.sh 
/opt/tools/android-accept-licenses.sh "android update sdk --all --force --no-ui --filter platform-tools,tools,build-tools-23.0.2,android-23,extra-android-support,extra-android-m2repository,extra-google-m2repository,extra-google-google_play_services"

#Cleanup
apt-get autoremove
apt-get autoclean
apt-get clean
rm -rf /var/lib/apt/lists/*
