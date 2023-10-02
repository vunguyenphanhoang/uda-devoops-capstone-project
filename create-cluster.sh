#! /bin/bash

REGION="us-west-2"
CLUSTER=capstone-v2

cluster_exists() {
    kubectl config get-contexts | awk '{print $3}' | grep "capstone"
}

if cluster_exists; then
    echo "Cluster '${CLUSTER}.${REGION}$' already exists!"
else
    echo "Creating cluster..."
    eksctl create cluster --name "$CLUSTER" --region="$REGION" --nodes-min=2 --nodes-max=3
fi