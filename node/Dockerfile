FROM ubuntu:16.04

COPY ./bootstrap.sh /root
RUN /root/bootstrap.sh && rm /root/bootstrap.sh
USER www-data
