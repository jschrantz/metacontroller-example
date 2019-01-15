#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

echo "Create cluster-mixed-example ClusterMixed object..."
kubectl apply -f example.yaml && sleep 5
echo

echo "Verify the namespace and networkpolicy are there..."
kubectl get ns/cluster-mixed-example
kubectl -n cluster-mixed-example get networkpolicy default-deny
echo

echo "Delete the namespace..."
kubectl delete ns/cluster-mixed-example && sleep 5
echo
echo "Verify the namespace and networkpolicy were recreated..."
kubectl get ns/cluster-mixed-example
kubectl -n cluster-mixed-example get networkpolicy default-deny
echo


echo "Delete the NetworkPolicy..."
kubectl -n cluster-mixed-example delete networkpolicy default-deny && sleep 5
echo

echo "The NetworkPolicy deletion is not detected and so is not recreated..."
kubectl -n cluster-mixed-example get networkpolicy default-deny
echo

echo "Delete the ClusterMixed object..."
kubectl delete ClusterMixed.example.com cluster-mixed-example
echo