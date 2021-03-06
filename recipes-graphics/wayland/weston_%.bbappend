FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

SRC_URI_append = "\
    file://weston.ini \
    file://weston.service \
"

inherit systemd
DEPENDS_append = " systemd"

RDEPENDS_${PN}_append_qemux86 = " mesa-megadriver"
RDEPENDS_${PN}_append_qemux86-64 = " mesa-megadriver"
RDEPENDS_${PN}_append_vexpressa9 = " mesa-megadriver"

EXTRA_OECONF_append_vexpressa9 = " WESTON_NATIVE_BACKEND=fbdev-backend.so"

EXTRA_OECONF_remove_rpi = "\
    --enable-rpi-compositor \
    WESTON_NATIVE_BACKEND=rpi-backend.so \
"

EXTRA_OECONF_append_rpi = "\
    WESTON_NATIVE_BACKEND=drm-backend.so \
    --disable-static \
"

CFLAGS_append_rpi ="\
    -I${STAGING_DIR_TARGET}/usr/include/interface/vcos/pthreads \
    -I${STAGING_DIR_TARGET}/usr/include/interface/vmcs_host/linux \
"

do_install_append() {
    mkdir -p ${D}${systemd_unitdir}/system/
    cp ${WORKDIR}/weston.service ${D}${systemd_unitdir}/system/
    mkdir -p ${D}${systemd_unitdir}/system/multi-user.target.wants/
    ln -sf /lib/systemd/system/weston.service ${D}/${systemd_unitdir}/system/multi-user.target.wants/weston.service

    WESTON_INI_CONFIG=${sysconfdir}/xdg/weston
    install -d ${D}${WESTON_INI_CONFIG}
    install -m 0644 ${WORKDIR}/weston.ini ${D}${WESTON_INI_CONFIG}/weston.ini
}

FILES_${PN} += "${systemd_unitdir}/system/*"
