## Frontend Ingress

To get an understanding of Profiles in Kubernetes usage please read carefully [Developer Docs - Profiles](https://developer-docs.citrix.com/projects/citrix-k8s-ingress-controller/en/latest/configure/profiles/#understand-citrix-adc-configuration-in-kubernetes-environment)

There are some important notes:
- to provide HTTP/2 or websockets at your fronebd CS-vserver you have to use HTTP profiles
- to provide SSL or TCP configurations to your frontend CS-Server you have to use SSL- or TCP-Profiles
- profile configuration for Citrix ADCs will be provided through annotations in the ingress definition
- you **can not** provide frontend **and** backend defintion in one single defintion! This means you need
   - one definition for all your frontend stuff (IP adress, ports, profiles)
   - and one separate definition for your backend stuff (URL, backend profiles, services)

1. deploy namespace for frontend Ingress
  ```
  kubectl apply -f 01_vpx-ingress-namespace.yaml
  ```

2. deploy frontend Ingress

  This file contains the CIC deployment and the frontend ingress definition.

  **BEFORE DEPLOYING:**

  **change values of NSIP and Username/Password in `02_cic_vpx.yaml` according to your VPX configuration**

  ```
  kubectl apply -f 02_cic_vpx.yaml
  ```

3. deploy servicemonitor

  This deployment is necessary for prometheus integration of CIC metrics exporter. If you have deployed the [coffeshop demo](../coffeeshop) this was deployed already. If you execute the next command, there will be no change

  ```
  kubectl apply -f 03_service-monitor.yaml
  ```

  This frontend deployment is a prerequisite to other demos in this repository.
