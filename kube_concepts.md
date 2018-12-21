## Controllers
### StatefulSets
* it maintains state of the application, by that it usually means there is persistent storage.
* prior to 1.9 , StatefulSets are beta.

### DaemonSets
* runs along with the all the nodes or a part of the nodes. 

### Deployment VS ReplicaSet
We can specify replica in both controllers, but Deployment allows us to scale up and down the pod. Deployment has wider usage than ReplicaSet.
Normally we just use Deployment. 

## Ingress
### ClusterIp VS NodePort VS Load Balancer
The service exposed with ClusterIp are only visible inside the cluster while NodePort service are available to the outside. NodePort is available for minikube. Public cloud providers normally ship with Load Balancer, a more advanced ingress, which is not avaiable on minikube.
