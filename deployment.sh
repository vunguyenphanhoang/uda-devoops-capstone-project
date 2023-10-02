#! /bin/bash
# aws eks update-kubeconfig --region us-west-2 --name capstone-v2
kubectl create deployment uda-devoops-capstone-project --image=vunguyenphanhoang/uda-devoops-capstone-project:v2 --replicas=4 && \
kubectl expose deployment/uda-devoops-capstone-project --type="LoadBalancer" --port 80
echo "deploy"
kubectl get deployments -o wide
echo "service"
kubectl get services -o wide
echo "pod"
kubectl get pods -o wide
