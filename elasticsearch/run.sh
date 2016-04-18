#!/bin/sh

# provision elasticsearch user
addgroup sudo
adduser -D -g '' elasticsearch
adduser elasticsearch sudo
chown -R elasticsearch /elasticsearch /data
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# set environment
export CLUSTER_NAME=${CLUSTER_NAME:-elasticsearch-default}
export NODE_MASTER=${NODE_MASTER:-true}
export NODE_DATA=${NODE_DATA:-true}
export HTTP_ENABLE=${HTTP_ENABLE:-true}
export MULTICAST=${MULTICAST:-true}

# Kubernetes stuff
export NAMESPACE=${NAMESPACE:-default}
export DISCOVERY_SERVICE=${DISCOVERY_SERVICE:-elasticsearch-discovery}

# allow for memlock
ulimit -l unlimited

# add elasticsearch user
if [ "$ELASTICSEARCH_USER" ]; then
	/elasticsearch/bin/esusers useradd $ELASTICSEARCH_USER -r admin -p $ELASTICSEARCH_PASSWORD
fi
# add kibana user
if [ "$KIBANA_USER" ]; then
	/elasticsearch/bin/esusers useradd $KIBANA_USER -r kibana4_server -p $KIBANA_PASSWORD
fi
# add bookshout user
if [ "$BOOKSHOUT_USER" ]; then
	/elasticsearch/bin/esusers useradd $BOOKSHOUT_USER -r kibana4 -p $BOOKSHOUT_PASSWORD
fi

# run
sudo -E -u elasticsearch /elasticsearch/bin/elasticsearch
