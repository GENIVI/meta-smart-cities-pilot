LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ddcdb5f9c0e01d2cb21f2735b9876fc1"

DEPENDS = " qtbase qtlocation "
RDEPENDS_${PN} = " qtbase "

SRC_URI = "git://github.com/jmechnich/qtposition_gpsd.git"
    
SRC_URI_append = " \
    file://0001-add-install-path.patch \
"

# Modify these as desired
PV = "1.0+git"
SRCREV = "${AUTOREV}"

S = "${WORKDIR}/git"

inherit qmake5

FILES_${PN} += " * "
