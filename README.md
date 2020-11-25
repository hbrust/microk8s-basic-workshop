## Purpose

This repository should help to build a working MicroK8s demo environment for [Citrix Cloud Native Solution](https://www.citrix.com/products/citrix-adc/resources/microservices-app-delivery-best-practices.html) and get basic understanding of the components.

This project is based on [Canonical MicroK8s](https://microk8s.io).

## Disclaimer

**This project is no official Citrix project.**

**This project is maintained on best effort base and is not meant for production. It is only for Demo purpose. There might be security constraints by implementing this.**  

## Requirements

These guide requires you to have installed and accessible:
- [Ubuntu 20.04 LTS server](https://releases.ubuntu.com/20.04/) system

  - installed with OpenSSH
  ![ubuntu-install-with-openssh](/images/ubuntu-install-openssh.png)

  - installed with microk8s
  ![ubuntu-install-with-openssh](/images/ubuntu-install-add-packages.png)

- [Citrix ADC VPX (Freemium Version)](https://www.citrix.com/downloads/citrix-adc/)

  To download virtual appliance, you need a [MyCitrix Account](https://www.citrix.com/account/)
  - Version 13.0-67.39

## Agenda / Steps

1. Clone this repository
  ```
  git clone https://github.com/hbrust/microk8s-basic-workshop.git
  ```

2. [Prerequisites](prerequisites)

  start with [Prerequisites](prerequisites)


3. first demo to build is Coffeeshop-Demo

   change current directory to `coffeeshop` and [go to Demo Script](coffeeshop)

3. understand frontend and backend ingress
  To get an understanding why frontend and backend ingress might be deployed separately, use [VPX-Ingress demo](vpx-ingress) for frontend. The following deployments use this frontend ingress (step 3) with their own backend ingress definition.
    - [System Dashboards](system-dashboards): provides integrated dashboards
    - [Xen Orchestrator](xen-orchestrator): provides XOA community version with Websockets enabled
    - [Guacamole](guacamole): this demo should show, how you can convert docker-compose files into Kubernetes definitions by using `[kompose](https://github.com/kubernetes/kompose)`

4. [System Dashboards](system-dashboards)
  publish integrated [System Dashboards](system-dashboards). This deployment uses frontend ingress from step 3.

5. [Xen Orchestrator](xen-orchestrator)
  provides XOA community version with Websockets enabled

6. [Guacamole](guacamole)
  this demo should show, how you can convert docker-compose files into Kubernetes definitions by using `[kompose](https://github.com/kubernetes/kompose)` and how to write an ingress definition    
