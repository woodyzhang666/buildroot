################################################################################
#
# python-hidapi
#
################################################################################

PYTHON_HIDAPI_VERSION = 0.11.0
PYTHON_HIDAPI_SITE = https://github.com/woodyzhang666/cython-hidapi
PYTHON_HIDAPI_SITE_METHOD = git
PYTHON_HIDAPI_GIT_SUBMODULES = yes
PYTHON_HIDAPI_LICENSE = GPL-3.0
PYTHON_HIDAPI_LICENSE_FILES = LICENSE-gpl3.txt
PYTHON_HIDAPI_SETUP_TYPE = setuptools
PYTHON_HIDAPI_BUILD_OPTS = --with-system-hidapi

$(eval $(python-package))
