#!/bin/bash

# Apply Cert-Manager
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.3/cert-manager.yaml

# Wait just a minute
echo "Waiting for the previous task to complete." && sleep 45

# Apply K8 OpenTelemetry Operator
kubectl apply -f https://github.com/open-telemetry/opentelemetry-operator/releases/download/v0.95.0/opentelemetry-operator.yaml

echo "Waiting for the previous task to complete." && sleep 30

# Configure APM agent using K8 operator
kubectl apply -f ~/oci-devlive-2024/sb-hol/customapmresource.yaml

echo "Waiting for the previous task to complete." && sleep 30

# Appyly APM java agent through the K8 namespace
kubectl apply -f ~/oci-devlive-2024/sb-hol/apmnamespace.yaml

echo "Waiting for the previous task to complete." && sleep 30

# To reflect the changes done at namespace - recreate the pods
kubectl delete pods --all

echo "Waiting for the previous task to complete." && sleep 30
