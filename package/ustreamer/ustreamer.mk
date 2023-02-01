###############################################################################
#
# ustreamer
#
################################################################################

USTREAMER_VERSION = v5.37
USTREAMER_SITE = $(call github,pikvm,ustreamer,$(USTREAMER_VERSION))
USTREAMER_LICENSE = GPL-3.0
USTREAMER_LICENSE_FILES = LICENSE

#USTREAMER_INSTALL_STAGING = YES

# imx-lib needs access to imx-specific kernel headers
USTREAMER_DEPENDENCIES += libevent libjpeg libbsd

USTREAMER_MAKE_ENV = \
	$(TARGET_MAKE_ENV) \
	$(TARGET_CONFIGURE_OPTS) \
	WITH_PYTHON=1 PREFIX=/usr \
	DESTDIR="$(TARGET_DIR)" \
	CC="$(TARGET_CC)"

define USTREAMER_BUILD_CMDS
	$(USTREAMER_MAKE_ENV) $(MAKE1) -C $(@D)
endef

define USTREAMER_INSTALL_TARGET_CMDS
	$(USTREAMER_MAKE_ENV) $(MAKE1) -C $(@D) install
endef

$(eval $(generic-package))
