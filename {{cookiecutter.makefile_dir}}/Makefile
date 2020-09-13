# Copyright © 2020 djrlj694.dev. All rights reserved.
# =========================================================================== #
# PROGRAM: Makefile
# AUTHORS: Robert (Bob) L. Jones
# CREATED: 12SEP2020
# REVISED: 13SEP2020
# =========================================================================== #


# =========================================================================== #
# EXTERNAL CONSTANTS
# =========================================================================== #

# -- Filesystem -- #

# Name of the main makefile.
MAKEFILE = $(firstword $(MAKEFILE_LIST))

# Absolute path of the directory containing the main makefile.
MAKEFILE_DIR ?= $(dir $(realpath $(MAKEFILE)))

# Path of the directory containing secondary makefiles.
MAKE_DIR ?= $(MAKEFILE_DIR).make


# ============================================================================ #
# PHONY TARGETS
# ============================================================================ #

# -- Main Targets -- #

.PHONY: all clean init test

all: help

## clean: Completes all cleaning activities.
clean: clean-github

## init: Completes all initial repo setup activities.
init: init-github


# =========================================================================== #
# FEATURE DEPENDENCIES
# =========================================================================== #

include $(MAKE_DIR)/features/formatting.mk

include $(MAKE_DIR)/features/debugging.mk
include $(MAKE_DIR)/features/helping.mk


# ============================================================================ #
# PLATFORM DEPENDENCIES
# ============================================================================ #

include $(MAKE_DIR)/platforms/GitHub.mk
