zip:
	./fss fixes.sh
	rm update.zip
	zip -r update.zip META-INF fixes

upload:
	adb push update.zip /sdcard
