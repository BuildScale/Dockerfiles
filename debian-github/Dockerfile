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
FROM buildscale/nagios-plugins:debian

LABEL org.opencontainers.image.description="Debian + my GitHub repos pre-built" \
      org.opencontainers.image.authors="KhulnaSoft, Ltd (https://www.linkedin.com/company/khulnasoft)" \
      org.opencontainers.image.url="https://ghcr.io/BuildScale/debian-github" \
      org.opencontainers.image.documentation="https://hub.docker.com/r/buildscale/debian-github" \
      org.opencontainers.image.source="https://github.com/BuildScale/Dockerfiles"

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir -pv /github

WORKDIR /github

COPY build.sh /

RUN /build.sh

COPY profile.d/java.sh /etc/profile.d/

ENV JAVA_HOME=/usr

ENV PATH $PATH:/github/nagios-plugins:/github/devops-perl-tools:/github/devops-python-tools:/github/bash-tools:/github/spotify

CMD ["/bin/bash"]
