FROM ubuntu:trusty
MAINTAINER Viacheslav Pryimak <vpryimak@intropro.com"

################## BEGIN INSTALLATION ######################
RUN apt-get update && \
  apt-get -y install wget libssl1.0.0 openjdk-7-jre && \
  wget -q https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/2.2.1/elasticsearch-2.2.1.deb -O elasticsearch.deb && \
  dpkg -i elasticsearch.deb && \
  rm elasticsearch.deb && /usr/share/elasticsearch/bin/plugin install mobz/elasticsearch-head
RUN chown -R elasticsearch:elasticsearch /usr/share/elasticsearch
ADD ./start.sh /
RUN chmod +x /start.sh
##################### INSTALLATION END #####################

ENTRYPOINT ["/start.sh"]
EXPOSE 22 9200 9300

