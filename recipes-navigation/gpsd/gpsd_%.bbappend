FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

SRC_URI_append = "\
    file://gpsd.service \
    file://gpsd-default \
"

SYSTEMD_AUTO_ENABLE = "enable"
