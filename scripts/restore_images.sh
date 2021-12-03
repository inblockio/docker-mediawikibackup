#!/bin/sh

set -e

imgfile="$(find /backup/latest -name '*.img.tar*')"
echo "Restoring images from $imgfile"
if [ -f "$imgfile" ]; then
  rm -rf /var/www/html/images/*
  tar xf "$imgfile" --directory=/var/www/html/images
else
  echo "Error: Unable to locate image archive in backup system"
fi
