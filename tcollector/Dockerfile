#
#  Author: KhulnaSoft, Ltd
#  Date: 2018-01-30 16:15:34 +0000 (Tue, 30 Jan 2018)
#
#  vim:ts=4:sts=4:sw=4:et
#
#  https://github.com/BuildScale/Dockerfiles
#
#  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
#
#  https://www.linkedin.com/company/khulnasoft
#

# nosemgrep: dockerfile.audit.dockerfile-source-not-pinned.dockerfile-source-not-pinned
FROM centos:7

ARG TCOLLECTOR_VERSION=1.3.2

LABEL org.opencontainers.image.description="OpenTSDB TCollector" \
      org.opencontainers.image.version="$TACHYON_VERSION" \
      org.opencontainers.image.authors="KhulnaSoft, Ltd (https://www.linkedin.com/company/khulnasoft)" \
      org.opencontainers.image.url="https://ghcr.io/BuildScale/tcollector" \
      org.opencontainers.image.documentation="https://hub.docker.com/r/buildscale/tcollector" \
      org.opencontainers.image.source="https://github.com/BuildScale/Dockerfiles"

ENV PATH $PATH:/tcollector:/usr/local/tcollector

WORKDIR /

RUN \
    yum install -y python && \
    #yum install -y git && \
    #git clone https://github.com/OpenTSDB/tcollector /tcollector && \
    yum install -y \
        "https://github.com/OpenTSDB/tcollector/releases/download/v${TCOLLECTOR_VERSION}RC2/tcollector-${TCOLLECTOR_VERSION}-2.noarch.rpm" \
        "https://github.com/OpenTSDB/tcollector/releases/download/v${TCOLLECTOR_VERSION}RC2/tcollector-collectors-${TCOLLECTOR_VERSION}-2.noarch.rpm" \
        && \
    yum autoremove -y && \
    yum clean all && \
    rm -rf /var/cache/yum

# RPM
ENV TCOLLECTOR_HOME="/usr/local/tcollector"
# GIT
#ENV TCOLLECTOR_HOME="/tcollector"

# RPM
CMD ["/usr/local/tcollector/tcollector.py", "-H", "opentsdb", "-c", "/usr/local/tcollector/collectors", "--logfile", "/dev/stdout", "--pidfile", "/tmp/tcollector.pid"]

# GIT
#CMD ["/tcollector/tcollector.py", "-H", "opentsdb", "-c", "/tcollector/collectors", "--logfile", "/dev/stdout", "--pidfile", "/tmp/tcollector.pid"]
