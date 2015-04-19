# Example:
ui_print("Mounting directories");
#unmount("/data");
#mount("MTD","userdata","/data");
ifelse(is_mounted("/system"), unmount("/system"));
mount("ext4", "EMMC", "/dev/block/platform/msm_sdcc.1/by-name/system", "/system");
##---- Customize Packages

$(cd fixes;
for f in *; do
	[ ! -d "$f" ] && continue
	[ ! -e "$f.txt" ] && continue

	title=$(grep "^Title: " "$f.txt" | sed -E 's/^Title: +//')
	cat <<dog
if
  file_getprop("/tmp/aroma/fixes.prop","$f") == "1"
then
  ui_print("Installing $title");
  package_extract_dir("fixes/$f", "/");
dog
	[ -e "$f.updater" ] && cat "$f.updater"
echo "endif;"
done)

ui_print("Unmounting directories");
unmount("/system");
ui_print("Installation finished");
