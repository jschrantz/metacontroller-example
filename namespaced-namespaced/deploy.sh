#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

# CRD and CompositeController
kubectl apply -f crd.yaml
kubectl apply -f controller.yaml

# Controller backend service
kubectl create ns namespaced-namespaced
kubectl -n namespaced-namespaced create configmap namespaced-namespaced-controller --from-file=sync.py
kubectl -n namespaced-namespaced apply -f webhook.yaml