#
#  Author: KhulnaSoft, Ltd
#  Date: 2016-01-16 09:58:07 +0000 (Sat, 16 Jan 2016)
#
#  vim:ts=4:sts=4:sw=4:et
#
#  https://github.com/BuildScale/Dockerfiles
#
#  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help improve or steer this or other code I publish
#
#  https://www.linkedin.com/company/khulnasoft
#

# nosemgrep: dockerfile.audit.dockerfile-source-not-pinned.dockerfile-source-not-pinned
FROM buildscale/nagios-plugins:centos

LABEL org.opencontainers.image.description="Advanced Nagios Plugins Collection (on CentOS) with Cassandra + Java installed" \
      org.opencontainers.image.authors="KhulnaSoft, Ltd (https://www.linkedin.com/company/khulnasoft)" \
      org.opencontainers.image.url="https://ghcr.io/BuildScale/nagios-plugins-cassandra" \
      org.opencontainers.image.documentation="https://hub.docker.com/r/buildscale/nagios-plugins-cassandra" \
      org.opencontainers.image.source="https://github.com/BuildScale/Dockerfiles"

ENV DEBIAN_FRONTEND noninteractive

COPY build2.sh /

# Cache Bust upon new commits
ADD https://api.github.com/repos/BuildScale/Nagios-Plugins/git/refs/heads/master /.git-hashref

# 2nd run is almost a noop without cache, and only an incremental update upon cache bust
RUN /build2.sh

ENV PATH $PATH:/cassandra/bin
