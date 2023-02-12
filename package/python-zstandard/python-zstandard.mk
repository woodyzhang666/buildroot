################################################################################
#
# python-zstandard
#
################################################################################

PYTHON_ZSTANDARD_VERSION = 0.19.0
PYTHON_ZSTANDARD_SOURCE = zstandard-$(PYTHON_ZSTANDARD_VERSION).tar.gz
PYTHON_ZSTANDARD_SITE = https://files.pythonhosted.org/packages/9a/50/1b7f7f710c0dfc1019ec4c7295f67855722c342af82f3132664ca6dc1c07
PYTHON_ZSTANDARD_SETUP_TYPE = setuptools
PYTHON_ZSTANDARD_DEPENDENCIES = host-pkgconf libffi python-cffi
PYTHON_ZSTANDARD_LICENSE = BSD
PYTHON_ZSTANDARD_LICENSE_FILES = LICENSE

$(eval $(python-package))
