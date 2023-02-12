################################################################################
#
# python-pam
#
################################################################################

PYTHON_PAM_VERSION = v2.02
PYTHON_PAM_SITE = https://github.com/FirefighterBlu3/python-pam
PYTHON_PAM_SITE_METHOD = git
PYTHON_PAM_SETUP_TYPE = setuptools
PYTHON_PAM_LICENSE = MIT
PYTHON_PAM_LICENSE_FILES = LICENSE

$(eval $(python-package))
