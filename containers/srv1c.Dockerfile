FROM ubuntu:23.04

ENV SERVER1C_VERSION 8.3.23
ENV REVISION 1782

RUN apt-get update && apt-get install locales -y
RUN localedef --inputfile ru_RU --force --charmap UTF-8 --alias-file /usr/share/locale/locale.alias ru_RU.UTF-8
ENV LANG ru_RU.utf8

RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections
RUN apt-get install ttf-mscorefonts-installer fontconfig imagemagick curl -y

ADD ${SERVER1C_VERSION}/*.deb /tmp/

RUN dpkg -i /tmp/1c-enterprise-${SERVER1C_VERSION}.${REVISION}-common_${SERVER1C_VERSION}-${REVISION}_amd64.deb \
  && dpkg -i /tmp/1c-enterprise-${SERVER1C_VERSION}.${REVISION}-server_${SERVER1C_VERSION}-${REVISION}_amd64.deb \
  && rm /tmp/*.deb

EXPOSE 1540-1541 1560-1591

USER usr1cv8:grp1cv8

ENTRYPOINT /opt/1cv8/x86_64/8.3.23.1782/ragent \
                        -d ${SRV1CV8_DATA} \
                        -port ${SRV1CV8_PORT} \
                        -regport ${SRV1CV8_REGPORT} \
                        -range ${SRV1CV8_RANGE} \
                        -seclev ${SRV1CV8_SECLEV} \
                        -pingPeriod ${SRV1CV8_PINGPERIOD} \
                        -pingTimeout ${SRV1CV8_PINGTIMEOUT} \
                        $SRV1CV8_DEBUG