#!/bin/sh

set -e

imgfile="$(find /backup/latest -name '*.img.tar*')"
if [ -f "$imgfile" ]; then
  rm -rf "$imgfile"
  tar xf "$imgfile" --directory=/var/www/html/images
else
  echo "Error: Unable to locate image archive in backup system"
fi
