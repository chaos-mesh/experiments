
helm repo add dgraph https://charts.dgraph.io
helm repo update
echo "Start clean and create namespace dgraph-chaos"
kubectl delete ns dgraph-chaos || echo "No namespace dgraph-chaos"
kubectl create ns dgraph-chaos
helm install dgraph dgraph/dgraph -n dgraph-chaos

sleep 60 # wait for dgraph is started
echo "Start chaos alpha"
kubectl apply -f pod-kill-alpha.yaml
