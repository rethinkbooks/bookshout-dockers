FROM logstash:1.5

RUN set -x \
	&& plugin install logstash-input-beats 

COPY config /etc/logstash/conf.d/
