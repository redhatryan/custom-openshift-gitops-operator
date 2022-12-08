## Custom OpenShift GitOps Installation

- OpenShift GitOps Operator v1.6.3
- OpenShift v4.11+

Deploy multiple cluster-scoped ArgoCD GitOps instances that have cluster-admin privilege using the OpenShift GitOps Operator.

Define the team deployment's projects and add a matching Kustomize `overlay` in the `openshift-gitops/overlays` folder.

Tell the operator where to deploy cluster-scoped ArgoCD GitOps instances
```bash
export GITOPS_NAMESPACES=appdev, <namespace>, <namespace>
```

Deploy the Cluster resources and the GitOps Operator.
```bash
oc apply -k openshift-gitops/cluster
sed "s/GITOPS_NAMESPACES/$GITOPS_NAMESPACES/" openshift-gitops/cluster/subscription-openshift-gitops.yaml | oc apply -f-
```

Deploy the cluster-scoped (privileged) ArgoCD instances
```
oc apply -k .
```

## Helper Documents

Deploy GitOps
```bash
./deployment-commands
```

Delete everything
```bash
./deletion-commands
```
