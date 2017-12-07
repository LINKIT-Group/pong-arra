#!/bin/bash -e
KEY=$1
APP_NAME=$2
TAG=$3
NAMESPACE=$4
curl -s -LO http://storage.googleapis.com/kubernetes-release/release/$(curl -s http://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x kubectl
mkdir -p ~/.kube
openssl aes-256-cbc -d -in k8s/kubeconfig.enc -k ${KEY} > ~/.kube/config
./kubectl --kubeconfig=$HOME/.kube/config set image -n ${NAMESPACE} deployment/${APP_NAME} ${APP_NAME}=linkitgroup/${APP_NAME}:${TAG}
./kubectl --kubeconfig=$HOME/.kube/config rollout status -n ${NAMESPACE} deployment/${APP_NAME}
