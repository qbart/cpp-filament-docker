FROM ubuntu:18.04

WORKDIR /app

USER root
RUN echo "Installing deps" \
         && export DEBIAN_FRONTEND=noninteractive  \
         && apt-get update \
         && apt-get install -y \
         wget \
         lsb-release \
         apt-utils \
         software-properties-common \
         build-essential

ADD docker_setup.sh /tmp/docker_setup.sh
RUN echo "Installing clang" \
         && chmod +x /tmp/docker_setup.sh \
         && sh /tmp/docker_setup.sh "9"

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*        

RUN mkdir -p /app/out
RUN mkdir -p /sdk

ADD entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ADD docker_deps.sh /sdk
RUN chmod +x /sdk/docker_deps.sh && /sdk/docker_deps.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
