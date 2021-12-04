#!/usr/bin/env sh

set -e

# Absolute path to MediaWiki settings configuration
# Override environment variable as needed
MEDIAWIKI_LOCALSETTINGS_PATH=${MEDIAWIKI_LOCALSETTINGS_PATH:-/var/www/html/LocalSettings.php}

unlock_mediawiki() {
    # shellcheck disable=SC2016
    message='$wgReadOnly = "Backup in progress.";'
    file=$MEDIAWIKI_LOCALSETTINGS_PATH
    if grep -q "$message" "$file"; then
        echo "DEBUG: Start unlock"
        sed "/$message/d" "$file" >modified_local_settings
        mv modified_local_settings "$file"
    else
        echo "Warn: MediaWiki already unlocked."
    fi
}

lock_mediawiki() {
    # shellcheck disable=SC2016
    message='$wgReadOnly = "Backup in progress.";'
    file=$MEDIAWIKI_LOCALSETTINGS_PATH
    if grep -q "$message" "$file"; then
        echo "DEBUG: Start lock"
        echo "Warn: MediaWiki already locked."
    else
        echo "$message" | tee -a "$file" >/dev/null
    fi
}
