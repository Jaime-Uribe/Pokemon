.PHONY: check_install_bundler check_install_cocoapods install_hooks setup_project

init: check_install_bundler check_install_cocoapods install_hooks setup_project

isBundlerInstalled := $(shell gem list -i bundler)
isCocoapodsInstalled := $(shell gem list -i cocoapods)

install_hooks:
	@find .git/hooks -type l -exec rm {} \;
	@find .githooks -type f -exec ln -sf ../../{} .git/hooks/ \;
	bash -c "chmod gu+x .githooks/pre-push"

check_install_bundler:
	$(info Checking if bundler is installed)
    ifeq ($(isBundlerInstalled), false)
		sudo gem install bundler
    endif

check_install_cocoapods:
	$(info Checking if cocoapods is installed)
    ifeq ($(isCocoapodsInstalled), false)
		sudo gem install cocoapods
    endif

setup_project:
	@cd EvercheckWallet && bundle install
	@cd EvercheckWallet && pod install