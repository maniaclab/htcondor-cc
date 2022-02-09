# htcondor for coffea-casa
Deploy a condor cluster in kubernetes for coffea-casa

# Instructions

## step 1 - Customizing 
edit kustomization.yaml and patch.yaml to customize the condor resources, htcondor versions etc


## step 2 - Deploy

```sh
kubectl apply -k <kustomization directory>/

```

## step 3 - configure coffea-casa to use the condor cluster

```sh
    CONDOR_HOST = condor.condor.svc.cluster.local
    SCHEDD_HOST = submit.condorsub.condor.svc.cluster.local
```
upudate secret_creation_hook.py
```sh
    condor_user = 'submituser@submit.condorsub.condor.svc.cluster.local'
    issuer = socket.gethostbyname('condor.condor.svc.cluster.local')
```

