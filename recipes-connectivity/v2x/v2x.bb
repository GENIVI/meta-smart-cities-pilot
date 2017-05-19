# Released under the MPL v2.0 license (see COPYING.MPL for the terms)

SUMMARY = "Service to reconfigure the v2x control ports"
FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

LICENSE = "MPL-2.0"
LIC_FILES_CHKSUM = "file://v2x.service;md5=2e381e73ff88e529aff5b06223ea077b"

SRC_URI = "\
    file://v2x.service \
    file://v2x-keep-alive.service \
    file://v2x-reset.sh \
    file://v2x-example.sh \
"

S = "${WORKDIR}"

inherit systemd

SYSTEMD_SERVICE_${PN} = "v2x-keep-alive.service"

SYSTEMD_AUTO_ENABLE = "enable"

do_install_append() {
    install -d ${D}${systemd_unitdir}/system
    install -m 0755 ${S}/v2x.service ${D}${systemd_unitdir}/system
    install -m 0755 ${S}/v2x-keep-alive.service ${D}${systemd_unitdir}/system
    install -d ${D}${sbindir}
    install -m 0755 ${S}/v2x-reset.sh ${D}${sbindir}
    install -m 0755 ${S}/v2x-example.sh ${D}${sbindir}
    sed -i -e 's,@SBINDIR@,${sbindir},g' \
           ${D}${systemd_unitdir}/system/v2x.service
    sed -i -e 's,@SBINDIR@,${sbindir},g' \
           ${D}${systemd_unitdir}/system/v2x-keep-alive.service
}

FILES_${PN} = " * "
