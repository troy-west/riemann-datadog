FROM centos:7

ADD install.sh /

RUN chmod +x /install.sh

RUN /install.sh

MAINTAINER Matthias Nüßler <m.nuessler@web.de>

ENV RIEMANN_VERSION 0.3.0
ENV RIEMANN_VERSION_SUFFIX -1

ADD https://github.com/riemann/riemann/releases/download/${RIEMANN_VERSION}/riemann-${RIEMANN_VERSION}${RIEMANN_VERSION_SUFFIX}.noarch.rpm /tmp/
RUN echo "f191bd6947eaf8902efff175642567c3 /tmp/riemann-${RIEMANN_VERSION}${RIEMANN_VERSION_SUFFIX}.noarch.rpm" \
    > /tmp/riemann-${RIEMANN_VERSION}${RIEMANN_VERSION_SUFFIX}.md5 && \
    md5sum -c /tmp/riemann-${RIEMANN_VERSION}${RIEMANN_VERSION_SUFFIX}.md5 && \
    yum install -y epel-release && \
    yum install -y daemonize && \
    yum localinstall -y /tmp/riemann-${RIEMANN_VERSION}${RIEMANN_VERSION_SUFFIX}.noarch.rpm && \
    rm /tmp/riemann* && \
    mkdir -p /etc/riemann/conf.d

RUN mkdir /riemann

ADD riemann.config /riemann/riemann.config

EXPOSE 5555 5556

ENTRYPOINT ["/usr/bin/riemann"]
CMD ["start","/riemann/riemann.config"]
