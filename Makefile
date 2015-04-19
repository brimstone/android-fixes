zip:
	zip -f update.zip META-INF

upload:
	adb push update.zip /sdcard
