# Copyright © 2020 djrlj694.dev. All rights reserved.
# =========================================================================== #
# PROGRAM: GitHub.mk
# AUTHORS: Robert (Bob) L. Jones
# CREATED: 13SEP2020
# REVISED: 13SEP2020
# =========================================================================== #


# =========================================================================== #
# EXTERNAL CONSTANTS
# =========================================================================== #

# -- Accounts -- #

GH_USER ?= $(shell whoami)

# -- Source Code Control (SCM) -- #

# GitHub API v3
GH_DESCRIPTION ?= This is a mock project.
GH_LICENSE_TEMPLATE ?= mit
GH_NAME ?= mock
GH_PRIVATE ?= true


# ============================================================================ #
# INTERNAL CONSTANTS
# ============================================================================ #

# -- Source Code Control (SCM) -- #

# GitHub
GH_REPO_PATH := $(GH_USER)/$(REPO_NAME)
GH_ORIGIN_URL := https://github.com/$(GH_REPO_PATH).git
GH_RAW_URL := https://raw.githubusercontent.com/$(GH_REPO_PATH)/master/%7B%7Bcookiecutter.project_name%7D%7D

# GitHub API v3
GH_API_URL := https://api.github.com/user/repos
GH_DATA := "name": "$(GH_NAME)"
GH_DATA += , "description": "$(GH_DESCRIPTION)"
GH_DATA += , "private": "$(GH_PRIVATE)"
ifeq ($(GH_LICENSE_TEMPLATE),)
GH_DATA += , "license_template": "$(GH_LICENSE_TEMPLATE)"
endif


# =========================================================================== #
# PHONY TARGETS
# =========================================================================== #

# -- Prerequisites for "clean" Target -- #

.PHONY: clean-github clean-docs-github

## clean-github: Completes all GitHub cleanup activities.
clean-github: clean-docs-github

## clean-docs-github: Completes all GitHub Markdown cleanup activities.
clean-docs-github: | $(LOG)
	@printf "Removing GitHub documents..."
	@rm -rf .github >$(LOG) 2>&1; \
	$(status_result)

# -- Prerequisite for "docs" Target -- #

.PHONY: docs-github

## docs-github: Completes all GitHub document generation activites.
docs-github: $(GITHUB_FILES)

# -- Prerequisites for "init" Target -- #

.PHONY: init-github init-github-dirs

## init-github: Completes all initial Github setup activites.
init-github:
	@printf "Initializing GitHub repository..."
	@curl -u $(GH_USER) $(GH_API_URL) -d '{$(GH_DATA)}'; \
	$(status_result)
