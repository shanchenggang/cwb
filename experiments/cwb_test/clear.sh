kubectl delete -f ./deploy/rbac-deploy.yaml
kubectl delete -f ./deploy/storageClass-nfs.yaml
kubectl delete -f ./deploy/buildInjector.yaml
kubectl delete -f ./deploy/resourceUsage.yaml
kubectl delete ns -A -l "namespace=task"
kubectl delete pv --all
rm -rf /nfsdata/*
rm -rf /home/*
