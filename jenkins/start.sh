#!/usr/bin/env bash

context="dev" #kube context
namespace="load" #kube namespace
test_file="jmeter-test.jmx" #jmx file name

[ -n ${test_file} ] || read -p 'Enter path to the jmx file ' test_file
if [ ! -f ${test_file} ];
then
    echo "Test script file was not found in PATH"
    echo "Kindly check and input the correct file path"
    exit
fi
test_name="$(basename ${test_file})"

echo "Getting master pod name from $context:$namespace"
master_pod=`kubectl get po -n ${namespace} --context ${context} | grep jmeter-master | awk '{print $1}'`

echo "Copying $test_file to $master_pod:/$test_name"
kubectl cp ${test_file} -n ${namespace} --context ${context} "$master_pod:/$test_name"

echo "Starting Jmeter load test on $master_pod"
kubectl exec -ti -n ${namespace} --context ${context} ${master_pod} -- /bin/bash /load_test ${test_name}