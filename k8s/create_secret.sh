kubectl create secret generic abagdemo-gcp-creds \
--from-file=./instance/creds/hazel-math-279814-ab43b8692187.json -n abagdemo \
--dry-run -o yaml | kubectl apply -f -