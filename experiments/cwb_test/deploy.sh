#!/bin/bash
kubectl apply -f ./deploy/rbac-deploy.yaml
kubectl apply -f ./deploy/storageClass-nfs.yaml
kubectl apply -f ./deploy/buildInjector.yaml
kubectl apply -f ./deploy/resourceUsage.yaml


