# eks-demo
Assignment 2 for Cloud-Computing-AWS-CSGY-9223


## Prerequisite
Install [remote container](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension on your VS code. Open this repository folder in VS Code and start the dev environment in container.
## Documentation
### Setup and use EKS cluster
Check using which AWS profile
```
aws sts get-caller-identity
```

Switch AWS profile if needed
```
export AWS_DEFAULT_PROFILE=<user>
```

Apply the terraform configuration in `terraform` and it will create a eks cluster and a node group
```
cd terraform
terraform init
terraform apply
```

Setup kubeconfig for EKS cluster
```
aws eks --region us-east-1 update-kubeconfig --name eks
```

Check if the cluster is working
```
kubectl get nodes
```

### Setup Prometheus
deploy helm chart with customized values
```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install -f k8s/prometheus/values.yaml prometheus prometheus-community/kube-prometheus-stack
```

setup port forwarding so that portal can be accessed locally
```
kubectl port-forward svc/prometheus-operated 9090
```




## Cleanup
uninstall prometheus
```
helm uninstall prometheus
```
uninstall eks cluster
```
cd terraform
terraform destroy
```

## Appendix
Add IAM User to EKS cluster
```
kubectl edit -n kube-system configmap/aws-auth
```
```
mapUsers: |
    - groups:
      - eks-console-dashboard-restricted-access-group      
      userarn: arn:aws:iam::444455556666:user/my-user
      username: my-user
```

Start minikube with docker driver
```bash
minikube start --driver=docker
```