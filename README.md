# htcondor for coffea-casa
Deploy a condor cluster in kubernetes for coffea-casa

# Instructions

## helm based installation

[Helm](https://helm.sh) must be installed to use the charts.
Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

Once Helm is set up properly, add the repo as follows:

```console
helm repo add htcondor http://maniaclab.uchicago.edu/htcondor-cc/
```

You can then run `helm search repo htcondor` to see the charts.

A typical installation would be
```console
helm install htcondor -n htcondor htcondor/htcondor
```

## manifest based installation

### step 1 - Customizing 
edit kustomization.yaml and patch.yaml to customize the condor resources, htcondor versions etc


### step 2 - Deploy

```sh
kubectl apply -k <kustomization directory>/

```

### step 3 - configure coffea-casa to use the condor cluster

```sh
    CONDOR_HOST = condor.condor.svc.cluster.local
    SCHEDD_HOST = submit.condorsub.condor.svc.cluster.local
```
upudate secret_creation_hook.py
```sh
    condor_user = 'submituser@submit.condorsub.condor.svc.cluster.local'
    issuer = socket.gethostbyname('condor.condor.svc.cluster.local')
```

