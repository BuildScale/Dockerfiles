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

# Alpine grep is broken and doesn't detect unbalanced regex parens which breaks tests
# nosemgrep: dockerfile.audit.dockerfile-source-not-pinned.dockerfile-source-not-pinned
FROM centos:8

LABEL org.opencontainers.image.description="DevOps Perl Tools (CentOS)" \
      org.opencontainers.image.authors="KhulnaSoft, Ltd (https://www.linkedin.com/company/khulnasoft)" \
      org.opencontainers.image.url="https://ghcr.io/BuildScale/perl-tools" \
      org.opencontainers.image.documentation="https://hub.docker.com/r/buildscale/perl-tools" \
      org.opencontainers.image.source="https://github.com/BuildScale/Dockerfiles"

# used by build.sh to figure out which repo to bootstrap
ENV PATH $PATH:/github/perl-tools

ADD https://raw.githubusercontent.com/BuildScale/DevOps-Scripts/master/setup/docker_bootstrap.sh /build.sh

RUN chmod +x /build.sh && NO_TESTS=1 /build.sh

# Cache Bust upon new commits
ADD https://api.github.com/repos/BuildScale/DevOps-Perl-tools/git/refs/heads/master /.git-hashref

ADD https://raw.githubusercontent.com/BuildScale/Dockerfiles/master/src/list_perl.sh /list.sh

# 2nd run is almost a noop without cache, and only an incremental update upon cache bust
RUN chmod +x /list.sh && /build.sh

WORKDIR /github/perl-tools

CMD ["/list.sh", "/github/perl-tools"]
