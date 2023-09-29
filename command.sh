# Create environment:
	terraform init	
# Validate code terraform
	terraform validate
# Plan create resource
	terraform plan -out solution.plan
# Apply plan to create resource
	terraform apply solution.plan
# Destroy resource
    terraform destroy

# Create eks cluster mat nhieu time => 20p de tao resource hoac destroy resource

# Command kubectl
    # Check version kubectl
	kubectl version --short
    # Config kubectl with eks
    aws eks --region us-east-1 update-kubeconfig --name udacity-prj3-eks
    # Check config kubectl
    kubectl config view
    # Check node
    kubectl get nodes
    # Check pod
    kubectl get pods
    # Check service => Get external ip to access api - thay the vao fe environment
    kubectl get svc
    # Check deployment
    kubectl get deployment
    # Check ingress
    kubectl get ingress
    # Access to pod terminal
    kubectl exec -it backend-feed-6c5dbc878-xlpdx -- /bin/bash
    # Set new image to deployment
    
    kubectl set image deployment/deployment_name container_name=image_name


    ## Apply env variables and secrets
kubectl apply -f aws-secret.yaml
kubectl apply -f env-secret.yaml
kubectl apply -f env-configmap.yaml
## Deployments - Double check the Dockerhub image name and version in the deployment files
kubectl apply -f backend-feed-deployment.yaml
kubectl apply -f backend-user-deployment.yaml
kubectl apply -f frontend-deployment.yaml
kubectl apply -f reverseproxy-deployment.yaml
## Do the same for other three deployment files
## Service
kubectl apply -f backend-feed-service.yaml
kubectl apply -f backend-user-service.yaml
kubectl apply -f frontend-service.yaml
kubectl apply -f reverseproxy-service.yaml
## Do the same for other three service files

## Check the deployment names and their pod status
kubectl get deployments
## Create a Service object that exposes the frontend deployment
## The command below will ceates an external load balancer and assigns a fixed, external IP to the Service.
kubectl expose deployment udagram-frontend --type=LoadBalancer --name=publicfrontend

kubectl expose deployment reverseproxy --type=LoadBalancer --name=publicreverseproxy
## Repeat the process for the *reverseproxy* deployment. 
## Check name, ClusterIP, and External IP of all deployments
kubectl get services 
kubectl get pods # It should show the STATUS as Running

## Run these commands from the /udagram-deployment directory
## Rolling update the containers of "frontend" deployment
kubectl set image deployment udagram-frontend udagram-frontend=dukeent/udagram-frontend:v8
kubectl set image deployment backend-feed backend-feed=dukeent/udagram-api-feed:v8
kubectl set image deployment backend-user backend-user=dukeent/udagram-api-user:v8
kubectl set image deployment reverseproxy reverseproxy=dukeent/udagram-reverseproxy:v8

    