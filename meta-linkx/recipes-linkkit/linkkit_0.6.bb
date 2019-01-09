DESCRIPTION = "AliOS Things Linux Edition ywssapp"
SUMMARY = "AliOS Things Linux Edition ywssapp"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"


SRC_URI = "file://linkkit-0.6.tar.gz \
           file://ywss.init \
           file://linkkit.kv"

# only support sysvinit for now.
inherit update-rc.d

INITSCRIPT_NAME = "ywss"
INITSCRIPT_PARAMS = "defaults 87"

TARGET_CC_ARCH += "${LDFLAGS}"
CFLAGS_prepend = "-O0 -g "

do_compile() {
    make ARCH=${TARGET_ARCH} -f Makefile.ywss wifi_module=rtk
}

do_install() {
    # create linkkit dir
    install -d ${D}/${bindir}/
    install -d ${D}/${datadir}/linkkit/
    install -d ${D}/${INIT_D_DIR}
    install -m 0644 ${WORKDIR}/linkkit.kv ${D}/${datadir}/linkkit/linkkit.kv
    install -m 0755 ${WORKDIR}/ywss.init ${D}/${INIT_D_DIR}/ywss
    install -m 0755 ${B}/ywssapp ${D}/${bindir}/ywssapp
}
