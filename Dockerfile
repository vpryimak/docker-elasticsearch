FROM ubuntu:trusty
MAINTAINER Viacheslav Pryimak <vpryimak@intropro.com"

################## BEGIN INSTALLATION ######################
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update && \
  apt-get -y upgrade && \
  apt-get -y install wget libssl1.0.0 python oracle-java8-installer  && \
  wget -q https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/2.2.1/elasticsearch-2.2.1.deb -O elasticsearch.deb && \
  dpkg -i elasticsearch.deb && \
  rm elasticsearch.deb && /usr/share/elasticsearch/bin/plugin install mobz/elasticsearch-head
##################### INSTALLATION END #####################

CMD ["/usr/share/elasticsearch/bin/elasticsearch"]

EXPOSE 22 9200 9300

