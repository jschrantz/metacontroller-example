#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

echo "Create namespaced-namespaced-example NamespacedNamespaced object..."
kubectl -n namespaced-namespaced apply -f example.yaml && sleep 5
echo

echo "Verify the configmap and networkpolicy are there..."
kubectl -n namespaced-namespaced get cm/namespaced-namespaced-example
kubectl -n namespaced-namespaced get networkpolicy/namespaced-namespaced-example
echo

echo "Delete the configmap and networkpolicy..."
kubectl -n namespaced-namespaced delete cm/namespaced-namespaced-example
kubectl -n namespaced-namespaced delete networkpolicy/namespaced-namespaced-example
sleep 5
echo

echo "Verify the configmap and networkpolicy were recreated..."
kubectl -n namespaced-namespaced get cm/namespaced-namespaced-example
kubectl -n namespaced-namespaced get networkpolicy/namespaced-namespaced-example
echo

echo "Delete the NamespacedNamespaced object..."
kubectl -n namespaced-namespaced delete NamespacedNamespaced.example.com/namespaced-namespaced-example
echo