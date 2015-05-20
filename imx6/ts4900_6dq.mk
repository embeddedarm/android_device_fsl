# This is a TS-4900DQ based on the sabresd
# It will inherit from FSL core product which in turn inherit from Google generic

$(call inherit-product, device/fsl/imx6/imx6.mk)

ifneq ($(wildcard device/fsl/ts4900_6dq/fstab_nand.freescale),)
$(shell touch device/fsl/ts4900_6dq/fstab_nand.freescale)
endif

ifneq ($(wildcard device/fsl/ts4900_6dq/fstab.freescale),)
$(shell touch device/fsl/ts4900_6dq/fstab.freescale)
endif

# Overrides
PRODUCT_NAME := ts4900_6dq
PRODUCT_DEVICE := ts4900_6dq

PRODUCT_COPY_FILES += \
	device/fsl/ts4900_6dq/required_hardware.xml:system/etc/permissions/required_hardware.xml \
	device/fsl/ts4900_6dq/init.rc:root/init.freescale.rc \
	device/fsl/ts4900_6dq/lcd.sh:root/lcd.sh \
	device/fsl/ts4900_6dq/ADS7843_Touchscreen.idc:system/usr/idc/ADS7843_Touchscreen.idc \
	device/fsl/ts4900_6dq/ADS7843_Touchscreen.idc:system/usr/idc/ADS7846_Touchscreen.idc \
	device/fsl/ts4900_6dq/pixcir_tangoc.idc:system/usr/idc/pixcir_tangoc.idc \
	device/fsl/ts4900_6dq/audio_policy.conf:system/etc/audio_policy.conf \
	device/fsl/ts4900_6dq/audio_effects.conf:system/vendor/etc/audio_effects.conf

PRODUCT_COPY_FILES +=	\
	external/linux-firmware-imx/firmware/vpu/vpu_fw_imx6d.bin:system/lib/firmware/vpu/vpu_fw_imx6d.bin 	\
	external/linux-firmware-imx/firmware/vpu/vpu_fw_imx6q.bin:system/lib/firmware/vpu/vpu_fw_imx6q.bin

# GPU files

DEVICE_PACKAGE_OVERLAYS := device/fsl/ts4900_6dq/overlay

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_AAPT_CONFIG += xlarge large tvdpi hdpi

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml

# for PDK build, include only when the dir exists
# too early to use $(TARGET_BUILD_PDK)
ifneq ($(wildcard packages/wallpapers/LivePicker),)
PRODUCT_COPY_FILES += \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml
endif

SUPERUSER_PACKAGE := com.ts.superuser
PRODUCT_PACKAGES += AudioRoute strace Superuser