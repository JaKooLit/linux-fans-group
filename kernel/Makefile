#[Dave Faulkmore](https://www.facebook.com/faulkmore)
#[Jefferson D. Grindle](https://www.facebook.com/jefferson.grindle)
.ONESHELL:
.DEFAULT_GOAL := all
SHELL := /bin/bash

#ERR MESSAGES -- Often used only
MSG_ROOT_NOT := Must be root to perform this action
MSG_USER_ONLY := Run as normal Linux session user, not as root

wrap_which = $(shell /bin/which $(1) 2>/dev/null ||:)
path_id = ${call wrap_which,id}
EUID = ${shell $(path_id) -u}

.PHONY: desktop
desktop: conf_brand := wallet-usb
desktop: conf_file := /usr/lib/sysctl.d/21-$(conf_brand).conf
desktop: usage := To set, make val=30 desktop
desktop: swappiness_advise := Recommandations. Server 60. Desktop 30
desktop: key_w_fallback := $(if $(key),$(key),vm.swappiness)
desktop: path_cat ?= ${call wrap_which,cat }
desktop: path_grep ?= ${call wrap_which,grep }
desktop: path_sed ?= ${call wrap_which,sed }
desktop: path_sysctl ?= ${call wrap_which,sysctl }
desktop: path_tee ?= ${call wrap_which,tee }
desktop: line = ${shell $(path_cat) $(conf_file) | $(path_grep) "$(key_w_fallback)" 2>/dev/null ||:}
desktop: current_val = ${shell $(path_sysctl) -n $(key_w_fallback)}
desktop: junk := ${shell [[ $(EUID) -ne 0 ]] && echo $(MSG_ROOT_NOT) 1>&2 ||: }
desktop:
	@if [[ $(EUID) -eq 0 ]]; then
	
	if [[ -z "$(val)" ]]; then
	
	$(path_sysctl) -n "$(key_w_fallback)"
	echo "$(usage)"
	echo "$(swappiness_advise)"
	
	else
	
	if [[ ! -f "$(conf_file)" ]] || [[ -z "$(line)" ]]; then
	
	echo "$(key_w_fallback) = $(val)" | $(path_tee) -a $(conf_file)
	$(path_sysctl) $(key_w_fallback)="$(val)"
	
	elif [[ -n "$(val)" ]] && [[ -n "$(line)" ]] && [[ "$(current_val)" -gt "$(val)" ]]; then
	
	$(path_sed) -i "s/$(line)/$(key_w_fallback)\ =\ $(val)/g" $(conf_file)
	$(path_sysctl) $(key_w_fallback)="$(val)"
	
	fi
	
	fi
	
	fi

.PHONY: all
all: desktop |
