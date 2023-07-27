FROM ubuntu:22.04

ENV SERVER_VERSION 8.3.23
ENV REVISION 1782

RUN apt-get update && apt-get install locales -y

RUN localedef --inputfile ru_RU --force --charmap UTF-8 --alias-file /usr/share/locale/locale.alias ru_RU.UTF-8
ENV LANG ru_RU.utf8

#RUN hostname server1c && echo "127.0.0.1    $(hostname)" | tee -a /etc/hosts

RUN apt-get install ttf-mscorefonts-installer fontconfig imagemagick curl -y

ADD 8.3.23/*.deb /tmp/

RUN dpkg -i /tmp/1c-enterprise-$SERVER_VERSION.$REVISION-common_$SERVER_VERSION-$REVISION_amd64.deb 2> /dev/null \
  && dpkg -i /tmp/1c-enterprise-$SERVER_VERSION.$REVISION-server_$SERVER_VERSION-$REVISION_amd64.deb \
  && rm /tmp/*.deb \


