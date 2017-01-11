#!/usr/bin/env bash
# Create directories and download Kubernetes Components
mkdir -p /etc/kubernetes/descriptors /etc/kubernetes/manifests /etc/kubernetes/ssl /opt/bin
for app in kubelet kube-proxy kubectl kube-controller-manager kube-scheduler
do
    if [[ -x /opt/bin/$app ]]; then
        echo "$app already installed"
    else
        curl -o /opt/bin/$app http://storage.googleapis.com/kubernetes-release/release/v1.5.1/bin/linux/amd64/$app
        chmod +x /opt/bin/$app
        echo "$app installed"
    fi
done
