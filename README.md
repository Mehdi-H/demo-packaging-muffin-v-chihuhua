# Packaging muffin-v-chihuahua

This repo offers some code to illustrate this blog article <http://link to come when published>.

It demonstrates two ways to package a Machine Learning application able to classify muffins and chihuahua in an image. This app needs 

* a pre-trained Deep Learning model,
* some images of muffins and chihuahuas, for demonstration purposes,
* some Python code.

Packaging of this Python app is done in Wheel format with setuptools and docker.

Packaging is done in two ways in order to demonstrate CD4ML model serving techniques:

* embedded model,
* and model deployed as a separate service.