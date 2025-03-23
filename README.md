# Kubernetes Development Environment

This repository contains the configuration and setup scripts for a local Kubernetes development environment using Minikube. It includes Ingress-Nginx for managing external access to services.

## Repository Structure

```
.
├── k8s/
│   └── ingress-nginx/
│       ├── Makefile        # Helm deployment commands for Ingress-Nginx
│       └── values.yaml     # Ingress-Nginx configuration values
├── scripts/
│   └── install_dependencies.sh  # Script to set up the development environment
└── README.md
```

## Prerequisites

- Ubuntu-based system
- Minimum 2GB of free RAM
- 20GB of free disk space
- Internet connection for downloading dependencies

## Installation Steps

1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd <repository-name>
   ```

2. Make the installation script executable:
   ```bash
   chmod +x scripts/install_dependencies.sh
   ```

3. Run the installation script:
   ```bash
   sudo ./scripts/install_dependencies.sh
   ```

4. Log out and log back in for the docker group changes to take effect.

5. Start Minikube:
   ```bash
   minikube start
   ```

6. Deploy Ingress-Nginx:
   ```bash
   cd k8s/ingress-nginx
   make deploy
   ```

## Accessing Services

### Minikube Dashboard
To access the Kubernetes dashboard:
```bash
minikube dashboard
```
This will open the dashboard in your default web browser.

### Ingress-Nginx
The Ingress-Nginx controller will be available at:
```bash
minikube ip
```
Default ports:
- HTTP: 80
- HTTPS: 443

## Useful Commands

### Check Cluster Status
```bash
minikube status
kubectl get nodes
kubectl get pods -n ingress-nginx
```

### Access Minikube Shell
```bash
minikube ssh
```

### View Logs
```bash
kubectl logs -n ingress-nginx -l app.kubernetes.io/name=ingress-nginx
```

## Cleanup Instructions

1. Delete Ingress-Nginx:
   ```bash
   cd k8s/ingress-nginx
   make delete
   ```

2. Stop Minikube:
   ```bash
   minikube stop
   ```

3. Delete Minikube cluster:
   ```bash
   minikube delete
   ```

4. (Optional) Uninstall dependencies:
   ```bash
   sudo apt-get remove docker-ce docker-ce-cli containerd.io kubectl minikube helm
   sudo apt-get autoremove
   ```

## Troubleshooting

1. If Minikube fails to start:
   ```bash
   minikube delete
   minikube start
   ```

2. If Ingress-Nginx pods are not running:
   ```bash
   kubectl describe pods -n ingress-nginx
   ```

3. To reset the entire environment:
   ```bash
   make delete
   minikube delete
   minikube start
   make deploy
   ```

## Additional Resources

- [Minikube Documentation](https://minikube.sigs.k8s.io/docs/)
- [Kubernetes Documentation](https://kubernetes.io/docs/)
- [Ingress-Nginx Documentation](https://kubernetes.github.io/ingress-nginx/)
