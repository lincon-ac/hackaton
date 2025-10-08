# Build the Docker images
docker build -t hackaton-backend:v1.0.0 ./DotNetApp
docker build -t hackaton-frontend:v1.0.0 ./ReactNativeApp

# If using minikube, load the images into minikube
minikube image load hackaton-backend:v1.0.0
minikube image load hackaton-frontend:v1.0.0

# Create namespace
kubectl create namespace hackaton

# Enable ingress addon if using minikube
minikube addons enable ingress

# Apply the Kubernetes manifests
kubectl apply -k k8s/

# Wait for pods to be ready
kubectl wait --namespace hackaton --for=condition=ready pod --all --timeout=300s