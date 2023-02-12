################################################################################
#
# python-kvmd
#
################################################################################

#PYTHON_KVMD_VERSION = 86b97210469e88a4603cb3c0226bce14315b2f94
#PYTHON_KVMD_SITE = https://github.com/woodyzhang666/kvmd
PYTHON_KVMD_VERSION = 098041a874a38bb4b2dadb133185659778b5c2a2
PYTHON_KVMD_SITE = file:///home/woody/workspace/kvmd/.git
PYTHON_KVMD_SITE_METHOD = git
PYTHON_KVMD_SETUP_TYPE = setuptools
PYTHON_KVMD_LICENSE = GPL-3.0
PYTHON_KVMD_LICENSE_FILES = LICENSE

define PYTHON_KVMD_COPY_FILES
	$(INSTALL) -D -m 755 -t $(TARGET_DIR)/usr/bin $(PYTHON_KVMD_BUILDDIR)/scripts/kvmd-bootconfig
	$(INSTALL) -D -m 755 -t $(TARGET_DIR)/usr/bin $(PYTHON_KVMD_BUILDDIR)/scripts/kvmd-gencert
	$(INSTALL) -D -m 755 -t $(TARGET_DIR)/usr/bin $(PYTHON_KVMD_BUILDDIR)/scripts/kvmd-certbot

    $(INSTALL) -D -m 644 -t $(TARGET_DIR)/usr/lib/systemd/system $(PYTHON_KVMD_BUILDDIR)/configs/os/services/kvmd-bootconfig.service
    $(INSTALL) -D -m 644 -t $(TARGET_DIR)/usr/lib/systemd/system $(PYTHON_KVMD_BUILDDIR)/configs/os/services/kvmd.service
    $(INSTALL) -D -m 644 -t $(TARGET_DIR)/usr/lib/systemd/system $(PYTHON_KVMD_BUILDDIR)/configs/os/services/kvmd-vnc.service
    $(INSTALL) -D -m 644 $(PYTHON_KVMD_BUILDDIR)/configs/os/sysusers.conf $(TARGET_DIR)/usr/lib/sysusers.d/kvmd.conf
    $(INSTALL) -D -m 644 $(PYTHON_KVMD_BUILDDIR)/configs/os/tmpfiles.conf $(TARGET_DIR)/usr/lib/tmpfiles.d/kvmd.conf

	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/share/kvmd
	cp -r $(PYTHON_KVMD_BUILDDIR){hid,web,extras,contrib/keymaps} $(TARGET_DIR)/usr/share/kvmd
	#$(INSTALL) -D -m 644 -t $(TARGET_DIR)/usr/share/kvmd/web $(PYTHON_KVMD_BUILDDIR)/web/**/*
	#$(INSTALL) -D -m 644 -t $(TARGET_DIR)/usr/share/kvmd/extras $(PYTHON_KVMD_BUILDDIR)/extras/*
	#$(INSTALL) -D -m 644 -t $(TARGET_DIR)/usr/share/kvmd/contrib/keymaps $(PYTHON_KVMD_BUILDDIR)/contrib/keymaps/*
    find $(TARGET_DIR)/usr/share/kvmd/web -name '*.pug' -exec rm -f '{}' \;

	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/share/kvmd/configs.default
	cp -r $(PYTHON_KVMD_BUILDDIR)configs/* $(TARGET_DIR)/usr/share/kvmd/configs.default

    find $(TARGET_DIR)/usr/share/kvmd -name ".gitignore" -delete

	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/kvmd/nginx/ssl
	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/kvmd/vnc/ssl
    $(INSTALL) -D -m 644 -t $(TARGET_DIR)/etc/kvmd/nginx $(TARGET_DIR)/usr/share/kvmd/configs.default/nginx/*.conf

    $(INSTALL) -D -m 444 -t $(TARGET_DIR)/etc/kvmd/janus $(TARGET_DIR)/usr/share/kvmd/configs.default/janus/*.jcfg

    $(INSTALL) -D -m 644 -t $(TARGET_DIR)/etc/kvmd $(TARGET_DIR)/usr/share/kvmd/configs.default/kvmd/*.yaml
    $(INSTALL) -D -m 600 -t $(TARGET_DIR)/etc/kvmd $(TARGET_DIR)/usr/share/kvmd/configs.default/kvmd/*passwd
    $(INSTALL) -D -m 600 -t $(TARGET_DIR)/etc/kvmd $(TARGET_DIR)/usr/share/kvmd/configs.default/kvmd/*.secret
    $(INSTALL) -D -m 644 -t $(TARGET_DIR)/etc/kvmd $(TARGET_DIR)/usr/share/kvmd/configs.default/kvmd/web.css
    $(INSTALL) -d -m 755 $(TARGET_DIR)/etc/kvmd/override.d

    $(INSTALL) -d -m 755 $(TARGET_DIR)/var/lib/kvmd/msd
    $(INSTALL) -d -m 755 $(TARGET_DIR)/var/lib/kvmd/pst

    # Avoid dhcp problems
    #$(INSTALL) -D -T -m 755 configs/os/netctl-dhcp "$pkgdir/etc/netctl/hooks/pikvm-dhcp"

	$(INSTALL) -D -m 755 -t $(TARGET_DIR)/usr/bin $(PYTHON_KVMD_BUILDDIR)/scripts/kvmd-udev-hdmiusb-check
	$(INSTALL) -D -T -m 644 $(PYTHON_KVMD_BUILDDIR)/configs/os/sysctl.conf $(TARGET_DIR)/etc/sysctl.d/99-kvmd.conf
    $(INSTALL) -D -T -m 644 $(PYTHON_KVMD_BUILDDIR)/configs/os/udev/woodylab-hdmiusb-d1.rules $(TARGET_DIR)/etc/udev/rules.d/99-kvmd.rules
    $(INSTALL) -D -T -m 444 $(PYTHON_KVMD_BUILDDIR)/configs/kvmd/main/woodylab-hdmiusb-d1.yaml $(TARGET_DIR)/etc/kvmd/main.yaml
endef

PYTHON_KVMD_POST_BUILD_HOOKS += PYTHON_KVMD_COPY_FILES

$(eval $(python-package))
