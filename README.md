## Commands to install


### Cilium

``` bash
helm install cilium-cni ./cilium-cni -f cilium-cni/values.yaml --namespace choreo-dp-cilium
```

### Other stuff

```bash
helm install choreo-opensource-dp ./choreo-opensource-dp -f choreo-opensource-dp/values.yaml --namespace choreo-dp
```


## Commands to uninstall

### Cilium

```bash
helm uninstall cilium-cni --namespace choreo-dp-cilium
```

### Other stuff

```bash
helm uninstall choreo-opensource-dp --namespace choreo-dp 
```