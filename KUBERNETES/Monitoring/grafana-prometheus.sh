#!/bin/bash

set -e

echo "Installing Grafana and Prometheus"
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

if helm status my-release -n monitoring >/dev/null 2>&1; then
    echo "Release exists — upgrading"
    helm upgrade my-release prometheus-community/kube-prometheus-stack \
        -n monitoring -f values.yaml
else
    echo "Release not found — installing"
    helm install my-release prometheus-community/kube-prometheus-stack \
        -n monitoring --create-namespace -f values.yaml
fi