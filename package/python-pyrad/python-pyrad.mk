################################################################################
#
# python-pyrad
#
################################################################################

PYTHON_PYRAD_VERSION = 2.4
PYTHON_PYRAD_SOURCE = pyrad-$(PYTHON_PYRAD_VERSION).tar.gz
PYTHON_PYRAD_SITE = https://files.pythonhosted.org/packages/fc/04/0fe33dca20685b3ced8359f487638bdf03f2776652f7f6812a639cce1b70
PYTHON_PYRAD_LICENSE = BSD
#PYTHON_PYRAD_LICENSE_FILES = LICENSE-gpl3.txt
PYTHON_PYRAD_SETUP_TYPE = setuptools

$(eval $(python-package))
