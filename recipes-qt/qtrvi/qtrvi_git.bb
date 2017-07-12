LICENSE = "MPL-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=9741c346eef56131163e13b9db1241b3"

DEPENDS = " librvi qtbase "
RDEPENDS_${PN} = " librvi "

SRC_URI = "\
    git://github.com/tjamison/qtrvi.git;protocol=https;branch=master \
    "

# Modify these as desired
PV = "1.0+git${SRCPV}"
SRCREV = "ff8548c5a786080c129b38a0ebd0a174bb50f4f7"

S = "${WORKDIR}/git"

inherit qmake5

FILES_${PN} += " ${libdir} "
