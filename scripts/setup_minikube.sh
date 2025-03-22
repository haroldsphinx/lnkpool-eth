# Start Minikube
echo "Starting Minikube..."
minikube start --driver=docker

# Enable Minikube addons
echo "Enabling Minikube addons..."
minikube addons enable metrics-server
minikube addons enable dashboard

echo "Installation completed successfully!"
echo "Please log out and log back in for the docker group changes to take effect."
echo "To verify the installation, run:"
echo "  minikube status"
echo "  kubectl get nodes"
