# Copyright 2006 The Android Open Source Project

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
    ril.cpp \
    ril_event.cpp

LOCAL_SHARED_LIBRARIES := \
    liblog \
    libutils \
    libbinder \
    libcutils \
    libhardware_legacy \
    librilutils

LOCAL_CFLAGS :=

ifeq ($(strip $(M2_VT_FEATURE_ENABLED)),true)
LOCAL_CFLAGS += -DM2_VT_FEATURE_ENABLED
endif

ifeq ($(strip $(M2_CALL_FAILED_CAUSE_FEATURE_ENABLED)),true)
LOCAL_CFLAGS += -DM2_CALL_FAILED_CAUSE_FEATURE_ENABLED
endif

ifeq ($(strip $(M2_PIN_RETRIES_FEATURE_ENABLED)),true)
LOCAL_CFLAGS += -DM2_PIN_RETRIES_FEATURE_ENABLED
endif

ifeq ($(strip $(M2_GET_SIM_SMS_STORAGE_ENABLED)),true)
LOCAL_CFLAGS += -DM2_GET_SIM_SMS_STORAGE_ENABLED
endif

LOCAL_MODULE:= libril

LOCAL_LDLIBS += -lpthread

include $(BUILD_SHARED_LIBRARY)


# For RdoServD which needs a static library
# =========================================
ifneq ($(ANDROID_BIONIC_TRANSITION),)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
    ril.cpp

LOCAL_STATIC_LIBRARIES := \
    libutils_static \
    libcutils \
    librilutils_static

LOCAL_CFLAGS :=

ifeq ($(strip $(M2_VT_FEATURE_ENABLED)),true)
LOCAL_CFLAGS += -DM2_VT_FEATURE_ENABLED
endif

ifeq ($(strip $(M2_CALL_FAILED_CAUSE_FEATURE_ENABLED)),true)
LOCAL_CFLAGS += -DM2_CALL_FAILED_CAUSE_FEATURE_ENABLED
endif

ifeq ($(strip $(M2_PIN_RETRIES_FEATURE_ENABLED)),true)
LOCAL_CFLAGS += -DM2_PIN_RETRIES_FEATURE_ENABLED
endif

ifeq ($(strip $(M2_GET_SIM_SMS_STORAGE_ENABLED)),true)
LOCAL_CFLAGS += -DM2_GET_SIM_SMS_STORAGE_ENABLED
endif

LOCAL_MODULE:= libril_static

LOCAL_LDLIBS += -lpthread

include $(BUILD_STATIC_LIBRARY)
endif # ANDROID_BIONIC_TRANSITION
