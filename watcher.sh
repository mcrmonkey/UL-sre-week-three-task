#!/bin/bash

NAMESPACE="sre"
DEPLOYMENT="swype-app"
RESTARTS_MAX=4

while true; do

  NO_RESTARTS=$(kubectl get pods -n ${NAMESPACE} -l app=${DEPLOYMENT} -o=jsonpath="{.items[0].status.containerStatuses[0].restartCount}")

  if [ -z ${NO_RESTARTS} ]
  then
	  echo "[!] Number of restarts for ${DEPLOYMENT} not found in ${NAMESPACE} namespace. Should be at least 0. Exiting."
	  exit 1
  fi

  echo "[i] The pod has restarted ${NO_RESTARTS} times."

  if (( ${NO_RESTARTS} >= ${RESTARTS_MAX} )); then
    echo "[!] Max restarts exceeded. Scaling down ${DEPLOYMENT}"
    kubectl scale --replicas=0 DEPLOYMENT/${DEPLOYMENT} -n ${NAMESPACE} && echo "Scaled down done." || echo "Error Scaling down"
    break
  fi

  sleep 60

done
