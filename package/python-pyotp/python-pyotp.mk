################################################################################
#
# python-pyotp
#
################################################################################

PYTHON_PYOTP_VERSION = 2.8.0
PYTHON_PYOTP_SOURCE = pyotp-$(PYTHON_PYOTP_VERSION).tar.gz
PYTHON_PYOTP_SITE = https://files.pythonhosted.org/packages/7e/f9/4c2ec78572a2d25f669220b8b9700c1133905ff6af9bf93c010778e82c65
PYTHON_PYOTP_SETUP_TYPE = setuptools
PYTHON_PYOTP_LICENSE = MIT
PYTHON_PYOTP_LICENSE_FILES = LICENSE

$(eval $(python-package))
