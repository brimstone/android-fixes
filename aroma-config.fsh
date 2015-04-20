theme("ics");
##
# Initializing Rom Information
#
ini_set("rom_name",             "Android Fixes");
ini_set("rom_version",          "0.0.0");
ini_set("rom_author",           "brimstone");
ini_set("rom_device",           "Any Device");
ini_set("rom_date",             "$(date "+%B %d %Y")");

#
# Set Small Font to Support all fonts
#
fontresload( "0", "ttf/Roboto-Regular.ttf;ttf/DroidSansFallback.ttf;", "12" );
fontresload( "1", "ttf/Roboto-Regular.ttf;ttf/DroidSansFallback.ttf;", "14" );
#
# INCLUDE EXAMPLE = Language Selection & Form Example
#
ini_set("text_next", "Install Now");
ini_set("icon_next", "@installbutton");
form(
    ini_get("rom_name") + " " + ini_get("rom_version"),
    "Select the fixes to enable",
    "@personalize",
    "fixes.prop"
  #
  # Type:
  #  - group              = Group
  #  - select             = Select Item
  #  - select.selected    = Selected Select Item
  #  - check              = Checkbox Item
  #  - check.checked      = Checked Checkbox Item
  #  - hide               = Hidden
  #
  #-------------+--------------------+--[ Selectbox Without Group ]----------------+---------------#
  # PROP ID     | TITLE              |  SUBTITLE                                   |    Type       #
  #-------------+--------------------+---------------------------------------------+---------------#

$(cd fixes;
for f in *; do
	[ ! -d "$f" ] && continue
	[ ! -e "$f.txt" ] && continue
	title=$(grep "^Title: " "$f.txt" | sed -E 's/^Title: +//')
	subtitle=$(grep "^Subtitle: " "$f.txt" | sed -E 's/^Subtitle: +//')
	cat <<doggy
,"$f", "$title", "$subtitle", "check"
doggy
done)
);


$(cd fixes;
for f in *; do
	[ ! -d "$f" ] && continue
	[ ! -e "$f.txt" ] && continue
	[ ! -e "$f.menu" ] && continue
	title=$(grep "^Title: " "$f.txt" | sed -E 's/^Title: +//')
	subtitle=$(grep "^Subtitle: " "$f.txt" | sed -E 's/^Subtitle: +//')
	cat <<doggy
if prop("fixes.prop", "$f")=="1" then
$(cat "$f.menu")
endif;
doggy
done)

ini_set("text_next", "Finish");
ini_set("icon_next", "@finish");
setvar("retstatus",
  install(
	#-- Title
      "Installing",
	
	#-- Installation Process message
	  "<b>"+ini_get("rom_name")+"</b> are being installed.\n\n"+
      "Please wait while installation wizard installs <b>"+ini_get("rom_name")+
	  "</b>.",
	
	#-- Installation Icon
      "@install",
	
	#-- Installation Finish Message
      "The installation wizard has successfully installed <b>"+ini_get("rom_name")+
	  "</b>."
  )
);

#if prop("fixes.prop","colorspace")!="default" then
#  ini_set("force_colorspace",prop("colorspace.prop","colorspace"));
#endif;
