#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

# CRD and CompositeController
kubectl apply -f crd.yaml
kubectl apply -f controller.yaml

# Controller backend service
kubectl create ns cluster-mixed
kubectl -n cluster-mixed create configmap cluster-mixed-controller --from-file=sync.py
kubectl -n cluster-mixed apply -f webhook.yaml