FROM ubuntu:14.04

MAINTAINER Matjaž Drolc "mdrolc@gmail.com"
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

COPY ./tools /opt/tools
RUN /opt/tools/bootstrap.sh
