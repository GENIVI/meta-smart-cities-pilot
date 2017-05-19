SRC_URI = " \
          git://github.com/tjamison/smart-cities.git \
          "
SRCREV = "${AUTOREV}"
LICENSE  = "MPL-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=9741c346eef56131163e13b9db1241b3"

DEPENDS = "dbus-c++ systemd wayland-ivi-extension qtquick1 qtbase qtrvi librvi qtposition-gpsd qtquickcontrols"

RDEPENDS_${PN} += "qtbase qtsvg qtrvi librvi qtposition-gpsd qtquickcontrols"

S = "${WORKDIR}/git"

inherit autotools pkgconfig qmake5 systemd

SYSTEMD_AUTO_ENABLE = "enable"

SRC_URI_append ="\
    file://smart-cities.service \
    file://0002-ignore-submodule.patch  \
    "

SRC_URI_append_rcar-gen2 ="\
    file://0001-Remove-cxx11-strings.patch \
    "

FILES_${PN} += "\
    ${libdir}/* \
    /opt/smart-cities/bin/smart-cities \
    /usr/share/applications/* \
    ${systemd_unitdir}/* \
    /home/* \
"

do_install_append() {
        install -d ${D}${libdir}/systemd/user
        install -m 0444 ${WORKDIR}/smart-cities.service \
                        ${D}${libdir}/systemd/user
        mkdir -p ${D}/home/root/.config/systemd/user/default.target.wants/smart-cities.service
	ln -sf /usr/lib/systemd/user/smart-cities.service ${D}/home/root/.config/systemd/user/default.target.wants/smart-cities.service
	install -d ${D}/usr/share/applications/
        install -m 0444 ${WORKDIR}/git/manifests/* \
                        ${D}/usr/share/applications/
}
