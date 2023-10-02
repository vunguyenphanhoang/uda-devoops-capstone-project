#! /bin/bash
DEPLOYMENT_NAME=uda-devoops-capstone-project
echo "Deleting ${DEPLOYMENT_NAME}"
kubectl delete services ${DEPLOYMENT_NAME}

echo "Deleting ${DEPLOYMENT_NAME}"
kubectl delete deployments ${DEPLOYMENT_NAME}

echo "deploy"
kubectl get deployments -o wide
echo "service"
kubectl get services -o wide
echo "pods"
kubectl get pods -o wide