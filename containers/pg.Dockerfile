FROM ubuntu:22.04

RUN apt-get update && apt-get install wget locales -y && \
  wget "https://repo.postgrespro.ru/1c-15/keys/pgpro-repo-add.sh" && chmod +x /pgpro-repo-add.sh && /pgpro-repo-add.sh

#RUN locale-gen en_US.UTF-8 && locale-gen ru_RU.UTF-8
RUN localedef --inputfile ru_RU --force --charmap UTF-8 --alias-file /usr/share/locale/locale.alias ru_RU.UTF-8
ENV LANG ru_RU.utf8

RUN apt-get update && apt-get install postgrespro-1c-15 -y

ADD pg-entrypoint.sh /

RUN chmod +x /pg-entrypoint.sh

EXPOSE 5432

USER postgres:postgres

ENTRYPOINT /pg-entrypoint.sh
