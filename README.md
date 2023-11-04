# eks-demo
Assignment 2 for Cloud-Computing-AWS-CSGY-9223

Setup kubeconfig for EKS cluster
```
aws eks --region us-east-1 update-kubeconfig --name eks-cluster --profile terraform
```

Start minikube with docker driver
```bash
minikube start -- driver=docker
```