#!/sbin/sh
# 
# /system/addon.d/99-browser.sh
#

. /tmp/backuptool.functions

case "$1" in
  backup)
    # Stub
  ;;
  restore)
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
	rm -rf /system/app/Browser.apk
	rm -rf /system/app/Browser
  ;;
esac
