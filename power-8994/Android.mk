# Copyright (C) 2017 The Android Open Source Project
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

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_SHARED_LIBRARIES := \
    liblog \
    libcutils \
    libdl \
    libxml2 \
    libhidlbase \
    libhidltransport \
    libhardware \
    libutils

LOCAL_SRC_FILES := \
    service.cpp \
    Power.cpp \
    power-helper.c \
    metadata-parser.c \
    utils.c \
    list.c \
    hint-data.c

LOCAL_C_INCLUDES := external/libxml2/include \
                    external/icu/icu4c/source/common
LOCAL_HEADER_LIBRARIES := libhardware_headers
LOCAL_CFLAGS += -Wall -Wextra -Werror

ifneq ($(BOARD_POWER_CUSTOM_BOARD_LIB),)
    LOCAL_WHOLE_STATIC_LIBRARIES += $(BOARD_POWER_CUSTOM_BOARD_LIB)
else

# Include target-specific files.
LOCAL_SRC_FILES += power-8994.c

endif  #  End of board specific list

ifneq ($(TARGET_POWER_SET_FEATURE_LIB),)
    LOCAL_STATIC_LIBRARIES += $(TARGET_POWER_SET_FEATURE_LIB)
endif

ifeq ($(TARGET_USES_INTERACTION_BOOST),true)
    LOCAL_CFLAGS += -DINTERACTION_BOOST
endif

ifneq ($(TARGET_POWERHAL_SET_INTERACTIVE_EXT),)
LOCAL_CFLAGS += -DSET_INTERACTIVE_EXT
LOCAL_SRC_FILES += ../../../$(TARGET_POWERHAL_SET_INTERACTIVE_EXT)
endif

ifneq ($(TARGET_TAP_TO_WAKE_NODE),)
    LOCAL_CFLAGS += -DTAP_TO_WAKE_NODE=\"$(TARGET_TAP_TO_WAKE_NODE)\"
endif

ifeq ($(TARGET_HAS_LEGACY_POWER_STATS),true)
    LOCAL_CFLAGS += -DLEGACY_STATS
endif

ifeq ($(TARGET_HAS_NO_POWER_STATS),true)
    LOCAL_CFLAGS += -DNO_STATS
endif

ifneq ($(TARGET_RPM_STAT),)
    LOCAL_CFLAGS += -DRPM_STAT=\"$(TARGET_RPM_STAT)\"
endif

ifneq ($(TARGET_RPM_MASTER_STAT),)
    LOCAL_CFLAGS += -DRPM_MASTER_STAT=\"$(TARGET_RPM_MASTER_STAT)\"
endif

ifneq ($(TARGET_RPM_SYSTEM_STAT),)
    LOCAL_CFLAGS += -DRPM_SYSTEM_STAT=\"$(TARGET_RPM_SYSTEM_STAT)\"
endif

ifneq ($(TARGET_WLAN_POWER_STAT),)
    LOCAL_CFLAGS += -DWLAN_POWER_STAT=\"$(TARGET_WLAN_POWER_STAT)\"
endif


LOCAL_MODULE := android.hardware.power-service-leo
LOCAL_INIT_RC := android.hardware.power-service-leo.rc
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS += -Wno-unused-parameter -Wno-unused-variable
LOCAL_VENDOR_MODULE := true
LOCAL_VINTF_FRAGMENTS := power.xml
include $(BUILD_EXECUTABLE)

