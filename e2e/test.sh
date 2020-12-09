#!/bin/bash
set -e

helm repo add gatekeeper https://open-policy-agent.github.io/gatekeeper/charts
helm repo update
helm upgrade --install gatekeeper gatekeeper/gatekeeper
helm upgrade --install --namespace gatekeeper-system -f values.yaml templates ../charts/gatekeeper-library-templates
helm upgrade --install --namespace gatekeeper-system -f values.yaml constraints ../charts/gatekeeper-library-constraints
