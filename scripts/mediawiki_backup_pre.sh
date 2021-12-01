#!/bin/sh

set -e

echo "Creating image archive (non-incremental)"
tar -cf /backup/latest/"$(date +"%Y-%m-%d_%Hh%Mm.%A")".img.tar \
    -C /var/www/html images/
