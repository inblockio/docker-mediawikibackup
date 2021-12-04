#!/usr/bin/env sh

set -e

# Source backup utilities with busybox support
dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)
# shellcheck disable=SC1091
. "$dir/mediawiki_backup_utils.sh"

# Lock MediaWiki prior to backup operation
lock_mediawiki

echo "Creating image archive (non-incremental)"
tar -cf /backup/latest/"$(date +"%Y-%m-%d_%Hh%Mm.%A")".img.tar \
    -C /var/www/html images/
