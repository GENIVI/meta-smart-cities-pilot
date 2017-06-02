LICENSE = "MPL-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=9741c346eef56131163e13b9db1241b3"

DEPENDS = " librvi qtbase "
RDEPENDS_${PN} = " librvi "

SRC_URI = "\
    git://github.com/PDXostc/qtrvi.git;protocol=https;branch=master \
    "

# Modify these as desired
PV = "1.0+git${SRCPV}"
SRCREV = "183c7d9fd7317966d92d71a1a26dd9c282003e4d"

S = "${WORKDIR}/git"

inherit qmake5

FILES_${PN} += " ${libdir} "
