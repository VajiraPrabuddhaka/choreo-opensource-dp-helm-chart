#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Function to install a Helm chart and wait for its readiness
install_helm_chart() {
  local chart_dir=$1
  local release_name=$2
  local namespace=$3

  echo "Installing Helm chart from $chart_dir..."
  helm upgrade --install "$release_name" "$chart_dir" --namespace "$namespace" --create-namespace

  echo "Waiting for all pods in the namespace $namespace to be ready..."
  kubectl wait --namespace "$namespace" \
    --for=condition=Ready pods \
    --all \
    --timeout=600s
}

# Install cilium-cni and wait for it to be ready
install_helm_chart "cilium-cni" "cilium" "choreo-dp-cilium"

# Install choreo-opensource-dp
install_helm_chart "choreo-opensource-dp" "choreo-opensource-dp" "choreo-dp"

echo "Both Helm charts have been installed successfully!"
