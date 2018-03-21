FROM alpine:3.6

# some helm plugins require git, bash
RUN apk --no-cache add curl bash openssl ca-certificates git \
    && curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > get_helm.sh \
    && chmod 700 get_helm.sh \
    && ./get_helm.sh -v v2.8.1 \
    && rm get_helm.sh

# downloads plugins
RUN helm init --client-only