#!/usr/bin/env bash
#  vim:ts=4:sts=4:sw=4:et
#
#  Author: KhulnaSoft, Ltd
#  Date: 2016-04-24 21:29:46 +0100 (Sun, 24 Apr 2016)
#
#  https://github.com/BuildScale/Dockerfiles
#
#  License: see accompanying KhulnaSoft, Ltd LICENSE file
#
#  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
#
#  https://www.linkedin.com/company/khulnasoft
#

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

export SOLR_USER="solr"

if [ $# -gt 0 ]; then
    exec "$@"
else
    if [ "$(whoami)" = "root" ]; then
        su - "$SOLR_USER" <<-EOF
            # preserve PATH from root
            export PATH="$PATH"
            /solr-start.sh
EOF
    else
        /solr-start.sh
    fi
fi
