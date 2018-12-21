# Controllers
## StatefulSets
* it maintains state of the application, by that it usually means there is persistent storage.

## DaemonSets
* runs along with the all the nodes or a part of the nodes. 

## Deployment VS ReplicaSet
We can specify replica in both controllers, but Deployment allows us to scale up and down the pod. Deployment has wider usage than ReplicaSet.
Normally we just use Deployment. 
