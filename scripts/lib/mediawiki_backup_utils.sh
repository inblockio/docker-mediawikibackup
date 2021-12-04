#!/usr/bin/env sh

set -e

# Absolute path to MediaWiki settings configuration
# Override environment variable as needed
MEDIAWIKI_SETTINGS_CONFIG_PATH=/etc/LocalSettings.php

#
unlock_mediawiki() {
    # shellcheck disable=SC2016
    message='$wgReadOnly = "Backup in progress.";'
    file=$MEDIAWIKI_SETTINGS_CONFIG_PATH
    if grep -q "$message" "$file"; then
        sed "/$message/d" "$file" >modified_local_settings
        mv modified_local_settings "$file"
    else
        echo "Warn: MediaWiki already unlocked."
    fi
}

lock_mediawiki() {
    # shellcheck disable=SC2016
    message='$wgReadOnly = "Backup in progress.";'
    file=$MEDIAWIKI_SETTINGS_CONFIG_PATH
    if grep -q "$message" "$file"; then
        echo "Warn: MediaWiki already locked."
    else
        echo "$message" | sudo tee -a "$file" >/dev/null
    fi
}
