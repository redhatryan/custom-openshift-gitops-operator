#Set your variable to capture teams requesting cluster-scoped (privileged) ArgoCD:

export GITOPS_NAMESPACES=appdev

#Install the OpenShift GitOps Operator and configure RBAC:

oc apply -k openshift-gitops/cluster
sed "s/GITOPS_NAMESPACES/$GITOPS_NAMESPACES/" openshift-gitops/cluster/subscription-openshift-gitops.yaml | oc apply -f-

#Watch CRDs and wait until they exist:

watch oc get crd argocds.argoproj.io applications.argoproj.io appprojects.argoproj.io

#Deploy team cluster-scoped ArgoCD instances
oc apply -k .
