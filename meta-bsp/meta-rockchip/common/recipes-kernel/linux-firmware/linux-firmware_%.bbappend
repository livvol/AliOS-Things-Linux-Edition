FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

# Install addition firmwares
do_install_append() {
	cp -r ${WORKDIR}/firmware ${D}${nonarch_base_libdir}/
}

# For broadcom
SRC_URI += " \
	file://firmware/brcm/brcmfmac43455-sdio.txt \
	file://firmware/brcm/brcmfmac43455-sdio.clm_blob \
"

PACKAGES_prepend += " \
	${PN}-bcm43455 \
"

LICENSE_${PN}-bcm43455 = "Firmware-broadcom_bcm43xx"
LICENSE_${PN}-broadcom-license = "Firmware-broadcom_bcm43xx"

FILES_${PN}-broadcom-license = " \
  ${nonarch_base_libdir}/firmware/LICENCE.broadcom_bcm43xx \
"
FILES_${PN}-bcm43455 = " \
  ${nonarch_base_libdir}/firmware/brcm/brcmfmac43455-sdio.* \
"

RDEPENDS_${PN}-bcm43455 += "${PN}-broadcom-license"

# For broadcom AP6236
SRC_URI += " \
	file://firmware/AP6236/wifi/fw_bcm43436b0.bin \
	file://firmware/AP6236/wifi/nvram_ap6236.txt \
"

PACKAGES_prepend += " \
	${PN}-bcm43436 \
"

LICENSE_${PN}-bcm43436 = "Firmware-broadcom_bcm43xx"
LICENSE_${PN}-broadcom-license = "Firmware-broadcom_bcm43xx"

FILES_${PN}-broadcom-license = " \
  ${nonarch_base_libdir}/firmware/LICENCE.broadcom_bcm43xx \
"
FILES_${PN}-bcm43436 = " \
  ${nonarch_base_libdir}/firmware/AP6236/wifi/fw_bcm43436b0.bin \
  ${nonarch_base_libdir}/firmware/AP6236/wifi/nvram_ap6236.txt \
"

RDEPENDS_${PN}-bcm43436 += "${PN}-broadcom-license"

# For realtek
SRC_URI += " \
	file://firmware/rtlbt/rtl8723d_config \
	file://firmware/rtlbt/rtl8723d_fw \
"

PACKAGES_prepend += " \
	${PN}-rtl8723ds \
"

LICENSE_${PN}-rtl8723ds = "Firmware-rtlwifi_firmware"

FILES_${PN}-rtl8723ds = " \
  ${nonarch_base_libdir}/firmware/rtlbt/rtl8723d_* \
"

RDEPENDS_${PN}-rtl8723ds += "${PN}-rtl-license"
