SCRIPTPATH=$(dirname "$0")

# delete broadcast from etcd and run compaction up until latest revision
kubectl exec etcd-0 -- bash -c "etcdctl compaction --physical=true $(kubectl exec etcd-0 -- bash -c 'etcdctl -w json del broadcast' | jq '.header.revision')"
# create new deployment
kubectl apply -f $SCRIPTPATH/benchmark-tamperproofbroadcast-deployment.yaml
