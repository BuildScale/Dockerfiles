#
#  Author: KhulnaSoft, Ltd
#  Date: 2017-09-13 14:47:23 +0200 (Wed, 13 Sep 2017)
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
FROM centos:7

# cache the std packages between tagged versions for space efficiency, must have this above ARG

# bash   => entrypoint.sh
# java   => presto cli
# less   => presto pager
RUN set -eux && \
    yum install -y bash java-1.8.0-openjdk-headless.x86_64 less && \
    yum clean all

ARG PRESTO_VERSION=0.179
ARG PRESTO_PKG_RELEASE=0.1

LABEL org.opencontainers.image.description="Presto SQL" \
      org.opencontainers.image.version="$PRESTO_VERSION" \
      org.opencontainers.image.authors="KhulnaSoft, Ltd (https://www.linkedin.com/company/khulnasoft)" \
      org.opencontainers.image.url="https://ghcr.io/BuildScale/presto-cli" \
      org.opencontainers.image.documentation="https://hub.docker.com/r/buildscale/presto-cli" \
      org.opencontainers.image.source="https://github.com/BuildScale/Dockerfiles"

WORKDIR /

# for faster build testing without having to download
#COPY $CLI_TAR /

RUN set -eux && \
    CLI_TAR="presto_client_pkg.${PRESTO_VERSION}-t.${PRESTO_PKG_RELEASE}.tar.gz" && \
    CLI_TAR_DIR="presto_client_pkg.${PRESTO_VERSION}-t.${PRESTO_PKG_RELEASE}" && \
    CLI_JAR="presto-cli-${PRESTO_VERSION}-t.${PRESTO_PKG_RELEASE}-executable.jar" && \
    CLI_URL="http://teradata-presto.s3.amazonaws.com/release-packages/${PRESTO_VERSION}-t.${PRESTO_PKG_RELEASE}/$CLI_TAR" && \
    yum install -y wget tar && \
    wget -c -t 10 --retry-connrefused -O "$CLI_TAR" "$CLI_URL" && \
    tar zxvf "$CLI_TAR" && \
    mv -iv "$CLI_TAR_DIR/$CLI_JAR" . && \
    chmod +x "$CLI_JAR" && \
    ln -sv "/$CLI_JAR" /usr/bin/presto && \
    # get rid of all the other unneeded drivers to save space
    rm -fr "$CLI_TAR" "$CLI_TAR_DIR" && \
    yum remove -y wget && \
    yum autoremove -y && \
    yum clean all && \
    rm -rf /var/cache/yum

ENTRYPOINT ["/usr/bin/presto"]
