FROM ubuntu:23.04

ENV SERVER1C_VERSION 8.3.23
ENV REVISION 1782

RUN apt-get update && apt-get install locales -y
RUN localedef --inputfile ru_RU --force --charmap UTF-8 --alias-file /usr/share/locale/locale.alias ru_RU.UTF-8
ENV LANG ru_RU.utf8

RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections
RUN apt-get install ttf-mscorefonts-installer fontconfig imagemagick curl -y

ADD 8.3.23/*.deb /tmp/
ADD 1c-entrypoint.sh /

RUN dpkg -i /tmp/1c-enterprise-${SERVER1C_VERSION}.${REVISION}-common_${SERVER1C_VERSION}-${REVISION}_amd64.deb \
  && dpkg -i /tmp/1c-enterprise-${SERVER1C_VERSION}.${REVISION}-server_${SERVER1C_VERSION}-${REVISION}_amd64.deb \
  && rm /tmp/*.deb \
  && chmod +x /1c-entrypoint.sh

EXPOSE 1540-1541 1560-1591

USER usr1cv8:grp1cv8

ENTRYPOINT /1c-entrypoint.sh