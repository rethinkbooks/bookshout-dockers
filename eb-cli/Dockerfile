FROM alpine:3.7
RUN apk --no-cache add \
        python \
        py-pip \
        groff \
        less \
        mailcap \
	git \
        && \
    pip install --upgrade awsebcli setuptools
VOLUME /root/.aws
VOLUME /project
WORKDIR /project
ENTRYPOINT ["eb"]
