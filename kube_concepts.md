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

## Misc
* [kubernetes network](https://blog.csdn.net/weixin_29115985/article/details/78963125)
* [K8S CNI](http://www.cnblogs.com/alauda/p/7986610.html)
* [kubernetes security context](https://www.kubernetes.org.cn/security-context-psp)
* [Logging architecture](https://kubernetes.io/docs/concepts/cluster-administration/logging/)
* [Pod security policy](https://kubernetes.io/docs/concepts/policy/pod-security-policy/)
* [what is Layer4 load balancing](https://www.nginx.com/resources/glossary/layer-4-load-balancing/)
* [Docker security best practices](https://thenewstack.io/5-docker-security-best-practices/)
* [Network policy](https://www.cnblogs.com/CloudMan6/p/9073610.html)
* [K8S network](https://www.open-open.com/lib/view/open1437616369584.html)
* [username space in Docker Engine](https://success.docker.com/article/introduction-to-user-namespaces-in-docker-engine)