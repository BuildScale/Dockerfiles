#!/usr/bin/env bash
#  vim:ts=4:sts=4:sw=4:et
#
#  Author: KhulnaSoft, Ltd
#  Date: 2016-02-18 00:02:54 +0000 (Thu, 18 Feb 2016)
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
srcdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$srcdir/.."

echo "checking repo names match directory tree"
for directory in *; do
    [ -d "$directory" ] || continue
    [ "$directory" = "bash-tools" ] && continue
    [ "$directory" = "pytools_checks" ] && continue
    #[[ "$directory" =~ devops-.*tools.* ]] && continue
    [ -f "$directory/Makefile" ] || continue
    # exclude things not in Git yet
    #git log -1 "$x" 2>/dev/null | grep -q '.*' || continue
    # shellcheck disable=SC2001
    repo="$(sed 's/\(.*nagios-plugins\)-\([[:alpha:]]*\)$/\1:\2/' <<< "$directory")"
    repo2="${repo%-*}:${repo##*-}"
    repo3="${repo2#devops-}"
    repo3="${repo3/python-tools/pytools}"
    repo3="${repo3/golang-tools/go-tools}"
    if ! grep -q -e "^REPO := buildscale/$repo" \
                 -e "^REPO := buildscale/$repo2" \
                 -e "^REPO := buildscale/$repo3" \
                 "$directory/Makefile"; then
        echo "$directory Makefile REPO mismatch!"
        exit 1
    fi
done
