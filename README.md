# Creating a k8s cluster

## Kind (Kubernetes in docker)

### Step 1 - Installing Kind

Make sure you have installed kind : https://kind.sigs.k8s.io/docs/user/quick-start/#installation

On macos via Homebrew

```
brew install kind
```

### Step 2 - Creating a Kind cluster

```
kind create cluster --config=kind-config.yaml
```

# Installing the helm chart

## Install in one-go

```
./install.sh
```

## Commands to install manually


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

