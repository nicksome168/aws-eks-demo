# eks-demo
Assignment 2 for Cloud-Computing-AWS-CSGY-9223


## Prerequisite
Install [remote container](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension on your VS code. Open this repository folder in VS Code and start the dev environment in container.


## AWS CLI
Check using which AWS profile
```
aws sts get-caller-identity
```

Switch AWS profile
```
export AWS_DEFAULT_PROFILE=<user>
```

Setup kubeconfig for EKS cluster
```
aws eks --region us-east-1 update-kubeconfig --name eks --profile <user>
```

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

## Minikube
Start minikube with docker driver
```bash
minikube start -- driver=docker
```