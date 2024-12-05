#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Function to uninstall a Helm release and clean up its namespace
uninstall_helm_release() {
  local release_name=$1
  local namespace=$2

  echo "Uninstalling Helm release: $release_name from namespace: $namespace..."
  helm uninstall "$release_name" --namespace "$namespace" || {
    echo "Failed to uninstall $release_name. It might not exist. Skipping..."
  }

  echo "Deleting namespace: $namespace if it exists..."
  kubectl delete namespace "$namespace" --ignore-not-found
}

# Uninstall choreo-opensource-dp
uninstall_helm_release "choreo-opensource-dp" "choreo-dp"

# Uninstall cilium-cni
uninstall_helm_release "cilium-cni" "choreo-dp-cilium"

echo "Both Helm releases have been uninstalled successfully!"
