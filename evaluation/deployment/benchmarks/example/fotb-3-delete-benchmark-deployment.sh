SCRIPTPATH=$(dirname "$0")

# delete all current deployments
kubectl delete --all -f $(dirname "$0")/fotb-3-benchmark-deployment.yaml
