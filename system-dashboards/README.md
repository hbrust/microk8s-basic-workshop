## System Dashboards

This demo script provides you the task and insights to publish the system dashboard via ingress. It uses for frontend the ingress definition from [vpx-ingress](../vpx-ingress).

1. Prerequisites
  Deployed frontend definition from [vpx-ingres](../vpx-ingress)

2. deploy the certificate
  This certificate was generated in [Prerequisites Step 6](../prerequisites')    
   ```
   kubectl apply -f dasboards-secret.yml
   ```

3. take look at `system-dashboards-ingress.yaml` to understand how the backend ingress definition works

  There are ingress definitions for:
  - K8s dashboards
  - Prometheus webinterface
  - Grafana

  There are many configurations the definitions have in common:
  - Namespace: All ingresses will be deployed in namespace `monitoring`. This is necessary because the ingress have to reside in the same namespace as the publsihed service
  - Ingress-Class: All definitions have the annotation `kubernetes.io/ingress.class="vpx"`. Be aware that ingress-class annotation will be [deprecated somewhen](https://kubernetes.io/docs/concepts/services-networking/ingress/#deprecated-annotation)
  - TLS secret: The certificate is a wildcard certificate. This certificate was generated in [Prerequisites Step 6](../prerequisites')    

  There are some special annotations to mention:
  - kubernetes-dashboard: Because the internal K8s dashboard is using SSL only you have to tell the ingress that the backend is SSSL and not HTTP. This will be done by using `ingress.citrix.com/secure-backend: '{"kubernetes-dashboard":"true"}'`

  ```
  kubectl apply -f system-dashboards-ingress.yaml
  ```

  Configure your `hosts` file or your dns to point
  ```
  dashboard.mk8s-demohost.demo
  grafana.mk8s-demohost.demo
  prometheus.mk8s-demohost.demo
  ```
  to your VPX frontend VIP address.

  Now you should be able to access the three domains and applications.
