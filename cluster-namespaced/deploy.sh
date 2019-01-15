#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

# CRD and CompositeController
kubectl apply -f crd.yaml
kubectl apply -f controller.yaml

# Controller backend service
kubectl create ns cluster-namespaced
kubectl -n cluster-namespaced create configmap cluster-namespaced-controller --from-file=sync.py
kubectl -n cluster-namespaced apply -f webhook.yaml