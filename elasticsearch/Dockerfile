FROM quay.io/pires/docker-elasticsearch:2.2.1

MAINTAINER pjpires@gmail.com

# Override elasticsearch.yml config, otherwise plug-in install will fail
ADD do_not_use.yml /elasticsearch/config/elasticsearch.yml

# Install Elasticsearch plug-ins
RUN /elasticsearch/bin/plugin install io.fabric8/elasticsearch-cloud-kubernetes/2.2.1_01 --verbose
RUN /elasticsearch/bin/plugin install license
RUN /elasticsearch/bin/plugin install shield
RUN /elasticsearch/bin/plugin install cloud-aws
RUN /elasticsearch/bin/plugin install lmenezes/elasticsearch-kopf/master

# Override elasticsearch.yml config, otherwise plug-in install will fail
ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Copy run script
COPY run.sh /
