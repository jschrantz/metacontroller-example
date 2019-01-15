#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

echo "Create cluster-namespaced-example ClusterNamespaced object..."
kubectl apply -f example.yaml && sleep 5
echo

echo "Verify the networkpolicy is there..."
kubectl -n cluster-namespaced get networkpolicy cluster-namespaced-example
echo

echo "Delete the networkpolicy..."
kubectl -n cluster-namespaced delete networkpolicy/cluster-namespaced-example && sleep 5
echo

echo "Verify the networkpolicy was recreated..."
kubectl -n cluster-namespaced get networkpolicy cluster-namespaced-example
echo

echo "Delete the ClusterNamespaced object..."
kubectl delete ClusterNamespaced.example.com cluster-namespaced-example
echo