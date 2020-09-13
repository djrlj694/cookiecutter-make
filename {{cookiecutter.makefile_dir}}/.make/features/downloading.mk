# Copyright © 2020 djrlj694.dev. All rights reserved.
# =========================================================================== #
# PROGRAM: downloading.mk
# AUTHORS: Robert (Bob) L. Jones
# CREATED: 13SEP2020
# REVISED: 13SEP2020
# =========================================================================== #


# =========================================================================== #
# USER-DEFINED FUNCTIONS
# =========================================================================== #

# $(call download-file,file,base-url)
# Downloads a file.
define download-file
	curl --silent --show-error --location --fail "$2" --output "$1"
endef
