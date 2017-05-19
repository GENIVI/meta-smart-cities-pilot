FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

SRC_URI_append = "\
    file://ip-up \
    file://ip-down \
    file://01setupgps \
    file://91removegps \
    file://options-mobile \
    file://mobile-modem.chat \
    file://apn.us.att \
    file://mode.NONE \
    file://pin.NONE \
    file://ppp@.service \
    file://provider \
    file://mobile-auth \
    file://mobile-noauth \
    file://att-simcom \
"

SYSTEMD_SERVICE_${PN} = "ppp@provider.service"

SYSTEMD_AUTO_ENABLE = "enable"

do_install_append() {
    install -m 0755 ${WORKDIR}/01setupgps ${D}${sysconfdir}/ppp/ip-up.d/
    install -m 0755 ${WORKDIR}/91removegps ${D}${sysconfdir}/ppp/ip-down.d/
    install -m 0755 ${WORKDIR}/options-mobile ${D}${sysconfdir}/ppp/
    mkdir -p ${D}${sysconfdir}/ppp/chatscripts
    install -m 0755 ${WORKDIR}/mobile-modem.chat ${D}${sysconfdir}/ppp/chatscripts/
    install -m 0755 ${WORKDIR}/apn.us.att ${D}${sysconfdir}/ppp/chatscripts/
    ln -s ${sysconfdir}/ppp/chatscripts/apn.us.att ${D}${sysconfdir}/ppp/chatscripts/apn
    install -m 0755 ${WORKDIR}/mode.NONE ${D}${sysconfdir}/ppp/chatscripts/
    ln -s ${sysconfdir}/ppp/chatscripts/mode.NONE ${D}${sysconfdir}/ppp/chatscripts/mode
    install -m 0755 ${WORKDIR}/pin.NONE ${D}${sysconfdir}/ppp/chatscripts/
    ln -s ${sysconfdir}/ppp/chatscripts/pin.NONE ${D}${sysconfdir}/ppp/chatscripts/pin
    mkdir -p ${D}${sysconfdir}/ppp/peers
    install -m 0755 ${WORKDIR}/provider ${D}${sysconfdir}/ppp/peers
    install -m 0755 ${WORKDIR}/mobile-auth ${D}${sysconfdir}/ppp/peers
    install -m 0755 ${WORKDIR}/mobile-noauth ${D}${sysconfdir}/ppp/peers
    install -m 0755 ${WORKDIR}/att-simcom ${D}${sysconfdir}/ppp/peers
}
