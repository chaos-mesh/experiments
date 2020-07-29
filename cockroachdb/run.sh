echo "install crdb helm charts"
helm repo add cockroachdb https://charts.cockroachdb.com/

echo "Start clean and create namespace crdb-chaos"
kubectl delete ns crdb-chaos || echo "No namespace crdb-chaos"
kubectl create ns crdb-chaos
helm install crdb cockroachdb/cockroachdb -n crdb-chaos