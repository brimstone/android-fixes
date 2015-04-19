#!/sbin/sh
# 
# /system/addon.d/99-dpi.sh
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
    sed -i 's/ro.sf.lcd_density=.*/ro.sf.lcd_density=DENSITY/' /system/build.prop
  ;;
esac
