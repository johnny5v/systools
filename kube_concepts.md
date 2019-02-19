## Import Kube concepts
* [see this](https://www.kubernetes.org.cn/kubernetes%E8%AE%BE%E8%AE%A1%E7%90%86%E5%BF%B5)
## Controllers
### StatefulSets
* it maintains state of the application, by that it usually means there is persistent storage.
* prior to 1.9 , StatefulSets are beta.

### DaemonSets
* runs along with the all the nodes or a part of the nodes. 

### Deployment VS ReplicaSet
We can specify replica in both controllers, but Deployment allows us to scale up and down the pod. Deployment has wider usage than ReplicaSet.
Normally we just use Deployment. 

## Publishing Service Service Type
### ClusterIp VS NodePort VS Load Balancer
The service exposed with ClusterIp are only visible inside the cluster while NodePort service are available to the outside. NodePort is available for minikube. Public cloud providers normally ship with Load Balancer, a more advanced ingress, which is not avaiable on minikube. Please check [this](https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types) for more details.

## How to debug K8s
[see this](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-application-introspection/)