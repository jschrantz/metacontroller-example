#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

# CRD and CompositeController
kubectl delete -f crd.yaml
kubectl delete -f controller.yaml

# Controller backend service
kubectl delete ns cluster-mixed