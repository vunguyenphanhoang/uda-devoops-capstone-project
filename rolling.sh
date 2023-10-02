#! /bin/bash

DEPLOYMENT_NAME=uda-devoops-capstone-project
NEW_IMAGE_NAME=registry.hub.docker.com/vunguyenphanhoang/uda-devoops-capstone-project:latest

kubectl get deployments -o wide
kubectl set image deployments/${DEPLOYMENT_NAME} ${DEPLOYMENT_NAME}=${NEW_IMAGE_NAME}
kubectl get deployments -o wide
kubectl describe pods | grep -i image
kubectl get pods -o wide