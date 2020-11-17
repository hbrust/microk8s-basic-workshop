## Prerequisites

1. Add your user to `microk8s` group to avoid `sudo`

   ```
   sudo usermod -a -G microk8s <user>
   sudo chown -f -R <user> ~/.kube
   ```

2. Add `.bash_aliases` to your home directory 

   (copy existing or write your own)

   ```
   # my aliases
   alias ls='ls -la --color=auto'
   alias mk='microk8s'
   alias kubectl='microk8s.kubectl'
   ```

3. make `kompose` executable and copy to `/usr/bin/`
   
   ```
   chmod +x kompose
   cp kompose /usr/bin/
   ``` 

4. logout and login again

5. [Optional] if you use a proxy to access internet, you have to put it in different files

   - for `containerd` make entry `HTTPS_PROXY=https://<yourProxyIP>:<ProxyPort>` in `/var/snap/microk8s/current/args/containerd-env`
   - for `curl` (necessary for microk8s modules) make entry `HTTPS_PROXY=https://<yourProxyIP>:<ProxyPort>` in `/etc/environment`
   - for `snapd` make entry `Environment="HTTPS_PROXY=http://<yourProxyIP>:<ProxyPort>"`in `/etc/systemd/system/snapd.service.d/snap_proxy.conf` 

6. enable microK8s modules
   ```
   microk8s enable dns dashboard prometheus storage
   ```

## Start with `coffeeshop`
tbd 
