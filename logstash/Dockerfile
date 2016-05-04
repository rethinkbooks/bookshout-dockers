FROM logstash:2.2

RUN set -x \
	&& plugin install logstash-input-beats \
  && plugin update logstash-input-beats \
  && plugin install logstash-output-elasticsearch_java \
  && plugin install logstash-output-elasticsearch_java_shield

COPY config /etc/logstash/conf.d/

CMD ["logstash", "agent", "-f", "/etc/logstash/conf.d/beats.conf"]
