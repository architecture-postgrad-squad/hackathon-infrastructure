#!/bin/bash

# Apply namespace
kubectl apply -f k8s/namespace.yml

# Apply Services
kubectl apply -f k8s/api-service.yaml

# Apply Secrets
kubectl apply -f k8s/secrets.yaml

# Apply Deployments
kubectl apply -f k8s/api-deployment.yaml
