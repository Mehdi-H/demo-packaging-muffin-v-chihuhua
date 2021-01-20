SHELL := /bin/bash
.SHELLFLAGS = -ec
.SILENT:
MAKEFLAGS += --silent
.ONESHELL:

.EXPORT_ALL_VARIABLES:
PYTHON_VERSION?=3.8.1

.DEFAULT_GOAL: help

.PHONY: help
help:
	echo "❓ Utiliser \`make <target>' où <target> peut être"
	grep -E '^\.PHONY: [a-zA-Z0-9_-]+ .*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = "(: |##)"}; {printf "\033[36m%-30s\033[0m %s\n", $$2, $$3}'

.PHONY: create-env  ## Create a python virtualenv
create-env:
	$(MAKE) -C ../ create-env

.PHONY: datasets  ## 🍪 🐶 ⬇️ Download some muffin and chihuahua images
datasets:
	$(MAKE) -C ../ datasets

.PHONY: model  ## 🧠 ⬇️ Download a model to classify muffin and chihuahua images
model:
	$(MAKE) -C ../ model

.PHONY: package  ## 📦 packaging the application as zip
package: datasets model
	zip -r muffin-v-chihuahua.zip ../muffin_v_chihuahua/

.PHONY: package  ## 📦 installing application from zipped package
install:
	unzip muffin-v-chihuahua.zip
