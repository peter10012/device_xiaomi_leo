#
# Copyright (C) 2017-2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/xiaomi/leo

TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_BOARD_PLATFORM := msm8994
TARGET_BOARD_PLATFORM_GPU := qcom-adreno430
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_USES_BUILD_COPY_HEADERS := true
SKIP_ABI_CHECK=true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_VINTF_PRODUCT_COPY_FILES := true

TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop

# Kernel
TARGET_KERNEL_CONFIG := leo_user_defconfig
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 boot_cpus=0-5 loop.max_part=7 androidboot.selinux=permissive
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_PAGESIZE :=  4096
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100
TARGET_KERNEL_SOURCE := kernel/xiaomi/leo
TARGET_KERNEL_VERSION := 4.9

# ANT
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Audio
AUDIO_USE_LL_AS_PRIMARY_OUTPUT := true
BOARD_SUPPORTS_SOUND_TRIGGER := true
BOARD_USES_ALSA_AUDIO := true
USE_CUSTOM_AUDIO_POLICY := 1
TARGET_USES_AOSP_FOR_AUDIO := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8994
TARGET_NO_BOOTLOADER := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
# Force camera module to be compiled only in 32-bit mode on 64-bit systems
# Once camera module can run in the native mode of the system (either
# 32-bit or 64-bit), the following line should be deleted
BOARD_QTI_CAMERA_32BIT_ONLY := true
TARGET_USES_MEDIA_EXTENSIONS := true
TARGET_CAMERASERVICE_CLOSES_NATIVE_HANDLES := true
TARGET_NEEDS_LEGACY_CAMERA_HAL1_DYN_NATIVE_HANDLE := true
TARGET_PROCESS_SDK_VERSION_OVERRIDE := \
    /system/vendor/bin/mm-qcamera-daemon=22

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true

# CNE and DPM
BOARD_USES_QCNE := true

# Crypto
TARGET_HW_DISK_ENCRYPTION := true

# Dexpreopt
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := false
      WITH_DEXPREOPT := true
    endif
  endif
endif

# Display
TARGET_SCREEN_DENSITY := 560
TARGET_USES_ION := true
TARGET_USES_NEW_ION_API :=true
TARGET_USES_GRALLOC1 := true
TARGET_USES_HWC2 := true
TARGET_USES_OVERLAY := true

OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
USE_OPENGL_RENDERER := true

# UI
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS :=  0x2000

# DRM
persist.vendor.dpm.feature=1 \
persist.vendor.dpmhalservice.enable=1 \
persist.vendor.dpm.loglevel=0 \
persist.vendor.mwqem.enable=1

# Filesystem
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ROOT_EXTRA_SYMLINKS := \
    /vendor/dsp:/dsp \
    /vendor/firmware_mnt:/firmware \
    /mnt/vendor/persist:/persist
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_SYSTEM_EXT := system/system_ext
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/config.fs

# FM
BOARD_HAVE_QCOM_FM := true

# GPS
USE_DEVICE_SPECIFIC_GPS := true
TARGET_NO_RPC := true
TARGET_USES_HARDWARE_QCOM_GPS := false

# HIDL
DEVICE_FRAMEWORK_MANIFEST_FILE := $(DEVICE_PATH)/framework_manifest.xml
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml
DEVICE_MATRIX_FILE   := $(DEVICE_PATH)/compatibility_matrix.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/vendor.qti.esepowermanager@1.0-service.xml

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Media
TARGET_USES_MEDIA_EXTENSIONS := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_USERDATAIMAGE_PARTITION_SIZE := 25765043200 # 25765059584 - 16384
BOARD_VENDORIMAGE_PARTITION_SIZE := 872415232

# Peripheral manager
TARGET_PER_MGR_ENABLED := true

# Power
TARGET_PROVIDES_POWERHAL := true
# TARGET_TAP_TO_WAKE_NODE := "/sys/devices/platform/soc/78b7000.i2c/i2c-3/3-0020/input/input2/wake_gesture"
# TARGET_HAS_NO_POWER_STATS := true
TARGET_USES_NON_LEGACY_POWERHAL := true

# Qualcomm
BOARD_USES_QCOM_HARDWARE := true

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.recovery.qcom

# RIL
DISABLE_RILD_OEM_HOOK := true

# Security patch level
VENDOR_SECURITY_PATCH := 2020-01-01

# SELinux
SELINUX_IGNORE_NEVERALLOWS := true
# include device/qcom/sepolicy-legacy-um/SEPolicy.mk
include device/qcom/sepolicy-legacy/sepolicy.mk
# BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(DEVICE_PATH)/sepolicy/private
# BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Shims
TARGET_LD_SHIM_LIBS += \
  /system/vendor/lib/hw/camera.vendor.msm8994.so|libshim_camera.so \
  /system/vendor/lib64/libril-qc-qmi-1.so|rild_socket.so \
  /system/vendor/lib/libmmcamera2_stats_algorithm.so|libshim_atomic.so \
  /system/vendor/lib64/libizat_core.so|libshims_get_process_name.so \
  /system/vendor/lib64/libril-qc-qmi-1.so|libaudioclient_shim.so

# Thermal
TARGET_THERMAL_HAL := true

# Treble
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true
PRODUCT_FULL_TREBLE_OVERRIDE := true
BOARD_VNDK_VERSION := current

# Wi-Fi
BOARD_HAS_QCOM_WLAN := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
TARGET_DISABLE_WCNSS_CONFIG_COPY := true
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WPA_SUPPLICANT_VERSION := VER_0_8_X
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true

# Inherit from the proprietary version
-include vendor/xiaomi/leo/BoardConfigVendor.mk
