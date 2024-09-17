<h1 align="center">Docker X11 Firefox Kiosk</h1>
<p align="center">Powered by </p>
<p align="center">
<a href="https://iaca-electronique.com">
<img alt="IACA Logo" style="" width="250px" src="https://www.iaca-electronique.com/img/logo.png">
</a>
</p>

___

## 📄 Purpose

This repository contains Docker configuration to build X11 Firefox kiosk mode image.


## Table of Contents

- [📄 Purpose](#-purpose)
- [🛠️ Build](#%EF%B8%8F-build)
- [▶️ Run](#-run)
    - [Allow Docker to access to X11 server](#1-allow-docker-to-access-to-x11-server)
    - [Run container](#2-run-container)
        - [From Docker Hub](#from-docker-hub-easy-way-no-build-required-)
        - [From your own build](#from-your-own-build-tagged-x11-firefox-kiosk-for-the-example-)
    - [Examples](#examples)
- [🧑‍🤝‍🧑 Contributors](#-contributors)

___

## 🛠️ Build

```bash
# Import
git clone https://github.com/IACA-Dev/docker-firefox-kiosk.git
cd docker-firefox-kiosk

# Build
docker build -t x11-firefox-kiosk .
```

## ▶️ Run

### 1. Allow Docker to access to X11 server

```bash
xhost + local:docker
```

### 2. Run container

#### From Docker Hub (easy way, no build required) :
```bash
docker run \
  --rm -i \
  -v <xauthority-dir>:/mnt/xauthority.d \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e XAUTHORITY=/mnt/xauthority.d/Xauthority \
  -e DISPLAY=$DISPLAY \
  --net=host \
  iacaelectronique/x11-firefox-kiosk <target-url>
```

#### From your own build (tagged "x11-firefox-kiosk" for the example) :
```bash
docker run \
  --rm -i \
  -v <xauthority-dir>:/mnt/xauthority.d \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e XAUTHORITY=/mnt/xauthority.d/Xauthority \
  -e DISPLAY=$DISPLAY \
  --net=host \
  x11-firefox-kiosk <target-url>
```

* Replace `<target-url>` with your own URL.

* Replace `$DISPLAY` **in case where you run container outside X11 environment.**
  This value can be found in `DISPLAY` environment variable in X11 environment.

* Replace `<xauthority-dir>` with the directory where you `Xauthority` file is stored. 
You can found it with the following command : 
```bash
dirname $(export | grep XAUTHORITY | awk -F'=' '{print $2}'| tr -d '"')
```
> **⚠️ Need to be executed in X11 working environment.**

### Examples

```bash
xhost + local:docker

docker run \
  --rm -i \
  -v /home/pi:/mnt/xauthority.d \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e XAUTHORITY=/mnt/xauthority.d/Xauthority \
  -e DISPLAY=$DISPLAY \
  --net=host \
  iacaelectronique/x11-firefox-kiosk www.google.com
```


## 🧑‍🤝‍🧑 Contributors

* Julien FAURE [✉️ julien.faure@iaca-electronique.com](mailto:julien.faure@iaca-electronique.com) (*IACA Electronique*)