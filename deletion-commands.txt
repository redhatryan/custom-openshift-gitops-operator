#Delete custom manifests:

oc delete -k .

#Delete OpenShift GitOps Operator and package manifests:

oc delete -f openshift-gitops/cluster/subscription-openshift-gitops.yaml
oc delete -k openshift-gitops/cluster

#Delete CSV

oc delete csv openshift-gitops-operator.v1.6.3 -n openshift-operators
