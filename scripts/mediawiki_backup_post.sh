#!/usr/bin/env sh

set -e

# Source backup utilities with busybox support
dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)
# shellcheck disable=SC1091
. "$dir/mediawiki_backup_utils.sh"

# Unlock MediaWiki following completion of backup operation
unlock_mediawiki
