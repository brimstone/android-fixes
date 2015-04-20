zip:
	./fss fixes.sh
	rm update.zip
	zip -r update.zip META-INF fixes

upload:
	adb push update.zip /sdcard/update.zip

test-reboot:
	adb shell 'echo "install /sdcard/update.zip" > /cache/recovery/openrecoveryscript'
	adb shell 'echo "cmd sleep 3600" >> /cache/recovery/openrecoveryscript'
	adb reboot recovery

test-soft:
	adb push META-INF/com/google/android/update-binary /tmp/
	adb shell chmod 755 /tmp/update-binary
	adb shell /tmp/update-binary 2 stdout /sdcard/update.zip

log:
	adb shell cat /sdcard/update.zip.log.txt
