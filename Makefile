PROJECT_DIR := $(abspath .)
ABLAC_DIR ?= $(abspath ../ablac)
COMPILER ?= $(ABLAC_DIR)/build/ablac
BUILD_DIR ?= $(PROJECT_DIR)/build
RUN_TEST := $(if $(ABLA_TEST_LD_LIBRARY_PATH),env LD_LIBRARY_PATH=$(ABLA_TEST_LD_LIBRARY_PATH),)
.PHONY: all build test clean
all: build
build:
	mkdir -p $(BUILD_DIR)
	cd $(PROJECT_DIR) && $(COMPILER) build tests/cli_test.ab -o $(BUILD_DIR)/cli-test --no-cache
test: build
	cd $(PROJECT_DIR) && $(RUN_TEST) $(BUILD_DIR)/cli-test
clean:
	@if [ -d "$(BUILD_DIR)" ]; then gio trash "$(BUILD_DIR)"; fi
