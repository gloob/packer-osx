# Packet templates for macOS

This repository contains Packer templates that can be used to create macOS Vagrant boxes.

## Current Boxes

* [macOS 12.x (Sierra)](https://atlas.hashicorp.com/)

## Building Boxes

To build any of the boxes you will need to have the following installed:

* [Packer](https://www.packer.io/)
* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](https://www.vagrantup.com/)

Also you will need a macOS installer from the Apple Store. You can check [here]() about how to download it.

Once the requirements have been met a build can be started by issuing these commands:

```
git submodule init
git submodule update
build.sh <location of macOS installer>
```

## Start a VM

To start a VM make sure the box as been added:

```
vagrant box add --name "osx1012-gpii" osx1012-gpii.box
vagrant init osx1012-gpii
```

And then a new instance can be created:

```
vagrant up
```
