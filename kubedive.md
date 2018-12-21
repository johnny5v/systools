# Command cheatsheet

## minikube

Start a minikube cluster with a proxy
```
minikube --vm-driver=hyperkit start --docker-env HTTP_PROXY=http://proxy:8080 --docker-env HTTPS_PROXY=http://proxy:8080
export no_proxy=$no_proxy,$(minikube ip)
```

Other useful commands

```bash
minikube ssh
minikube delete
minikube docker-env
minikube status
minikube service
minikube dashboard
```


## kubectl
```bash
kubectl -n kube-system logs kubernetes-dashboard-6f4cfc5d87-zqh2z
kubectl exec -it <pod-name> /bin/sh
kubectl port-forward <port-forward> 8086:8086
kubectl get events -n kube-system

```

## helm
```bash
helm init
helm list
helm repo list
helm status <release-name>
helm get <release-name>
```

## Troubleshoot
minikube ssh into the docker machine and run docker logs, or use kubectl logs command.

### User "system:serviceaccount:kube-system:default" cannot create secrets in the namespace "kube-system
workaround is:
```
kubectl create clusterrolebinding add-on-cluster-admin --clusterrole=cluster-admin --serviceaccount=kube-system:default

```
The github issue is [here](https://github.com/kubernetes/minikube/issues/3281).

