#!/usr/bin/env bash

context="dev" #kube context
namespace="load" #kube namespace
master_pod=`kubectl get po -n ${namespace} --context ${context} | grep jmeter-master | awk '{print $1}'`

echo "Stopping the test on $context:$namespace:$master_pod"
kubectl exec -ti ${master_pod} -n ${namespace} --context ${context} bash /jmeter/apache-jmeter-5.0/bin/stoptest.sh
