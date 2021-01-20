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

.PHONY: create-env  ## 🐍 Create a python virtualenv
create-env:
	eval "$(pyenv virtualenv-init -)" && \
		pyenv virtualenv ${PYTHON_VERSION} muffin-v-chihuhua-${PYTHON_VERSION} && \
		pyenv activate muffin-v-chihuhua-${PYTHON_VERSION}

.PHONY: dependencies  ## 🐍 ⬇️ Install python dependencies
dependencies:
	pip install -r requirements.txt

.PHONY: chihuahua-dataset  ## 🐶 ⬇️ Download some chihuahua images
chihuahua-dataset:
	curl -s http://image-net.org/api/text/imagenet.synset.geturls?wnid=n02085620 | head -n 50 > muffin_v_chihuahua/data/chihuahua/urls.txt
	cd muffin_v_chihuahua/data/chihuahua/ && wget -nc -i urls.txt || true
	echo "$$(ls | wc -l) images are now in this folder"

.PHONY: muffin-dataset  ## 🍪 ⬇️ Download some muffin images
muffin-dataset:
	curl -s http://image-net.org/api/text/imagenet.synset.geturls?wnid=n07690273 | head -n 50 > muffin_v_chihuahua/data/muffin/urls.txt
	cd muffin_v_chihuahua/data/muffin/ && wget -nc -i urls.txt || true
	echo "$$(ls | wc -l) images are now in this folder"

.PHONY: datasets  ## 🍪 🐶 ⬇️ Download some muffin and chihuahua images
datasets: chihuahua-dataset muffin-dataset

.PHONY: model  ## 🧠 ⬇️ Download a model to classify muffin and chihuahua images
model:
	wget -nc https://github.com/fchollet/deep-learning-models/releases/download/v0.5/inception_v3_weights_tf_dim_ordering_tf_kernels.h5 -O muffin_v_chihuahua/inception_v3_weights_tf_dim_ordering_tf_kernels.h5 || true