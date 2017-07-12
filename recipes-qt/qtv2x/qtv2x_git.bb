LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ddcdb5f9c0e01d2cb21f2735b9876fc1"

DEPENDS = " qtbase qtdeclarative"
RDEPENDS_${PN} = " qtbase "

SRC_URI = "git://github.com/smiller6/v2x-qt-plugin.git;protocol=https;branch=develop"

# Modify these as desired
PV = "1.0+git"
SRCREV = "${AUTOREV}"

S = "${WORKDIR}/git"

inherit qmake5

FILES_${PN} += " /usr/lib/qt5/qml/com/genivi/v2x/* "

FILES_${PN}-dbg = " \
  /usr/lib/qt5/qml/com/genivi/qtv2x/.debug/* \
  /usr/src/debug/qtv2x/* \
"
