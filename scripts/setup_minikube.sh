#!/bin/bash
set -e
## setting up minikube | https://minikube.sigs.k8s.io/docs/tutorials/multi_node/
# conditions: 
# - minikube istalled witj two nodes & resource efficient
echo "starting minikube"
minikube start --driver=docker --nodes 2 -p linkpool-eth

# separate worker node from control plane
kubectl get nodes
kubectl label nodes linkpool-eth-m02 node-role.kubernetes.io/worker=worker

# verify
kubectl get nodes --selector node-role.kubernetes.io/worker=worker

helm upgrade --install argocd argo/argo-cd --namespace argocd --set configs.params."server\.insecure"=true --wait 
