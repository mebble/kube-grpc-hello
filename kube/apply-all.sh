#!/bin/bash

kubectl apply -f filter.yaml
kubectl apply -f <(istioctl kube-inject -f backend.yaml)
kubectl apply -f gateway.yaml