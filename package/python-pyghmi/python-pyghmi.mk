################################################################################
#
# python-pyghmi
#
################################################################################

PYTHON_PYGHMI_VERSION = 1.5.57
PYTHON_PYGHMI_SOURCE = pyghmi-$(PYTHON_PYGHMI_VERSION).tar.gz
PYTHON_PYGHMI_SITE = https://files.pythonhosted.org/packages/b7/31/deb4fed7ada99c4cc69cfc0205920c94006ebc5b1e4d21079478bf7bd1ec
PYTHON_PYGHMI_LICENSE = Apache
PYTHON_PYGHMI_LICENSE_FILES = LICENSE
PYTHON_PYGHMI_SETUP_TYPE = setuptools

$(eval $(python-package))
