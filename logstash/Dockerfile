FROM logstash:2.2

RUN set -x \
	&& plugin install logstash-input-beats 
  && plugin update logstash-input-beats

COPY config /etc/logstash/conf.d/

CMD ["logstash", "agent", "-f", "/etc/logstash/conf.d/beats.conf"]
