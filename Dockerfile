# FileSender

FROM registry.vtg/vertigo/docker-base:latest

MAINTAINER Rubens Neto <rubens@vertigo.com.br>

RUN echo "Building..." && \
    wget http://repository.filesender.org/rpm/filesender-stable.repo -q -O /etc/yum.repos.d/filesender-stable.repo && \
    yum install mod_ssl filesender gettext -y && \
    yum clean all

ADD src/* /opt/

ADD src/*.conf /etc/httpd/conf.d/

EXPOSE 80
EXPOSE 443

CMD ["/opt/startfs.sh"]

