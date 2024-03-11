#!/bin/bash

# Apply Cert-Manager
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.3/cert-manager.yaml

# Apply K8 OpenTelemetry Operator
kubectl apply -f https://github.com/open-telemetry/opentelemetry-operator/releases/latest/download/opentelemetry-operator.yaml

# Configure APM agent using K8 operator
kubectl apply -f ~/oci-devlive-2024/sb-hol/customapmresource.yaml

# Appyly APM java agent through the K8 namespace
kubectl apply -f ~/oci-devlive-2024/sb-hol/apmnamespace.yaml

# To reflect the changes done at namespace - recreate the pods
kubectl delete pods --all