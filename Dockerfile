FROM ubuntu:trusty
MAINTAINER Viacheslav Pryimak <vpryimak@intropro.com"

################## BEGIN INSTALLATION ######################
RUN apt-get update && \
  apt-get -y upgrade && \
  apt-get -y install wget libssl1.0.0 python openjdk-7-jre  && \
  wget -q https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.5.2.deb -O elasticsearch.deb && \
  dpkg -i elasticsearch.deb && \
  rm elasticsearch.deb && /usr/share/elasticsearch/bin/plugin -install mobz/elasticsearch-head
##################### INSTALLATION END #####################

CMD ["/usr/share/elasticsearch/bin/elasticsearch"]

EXPOSE 22 9200 9300
