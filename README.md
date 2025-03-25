# Kubernetes Development Environment

This repository contains the configuration and setup scripts for an ethereum node deployment on k8s


## Installation Steps

2. Make the installation script executable:
   ```bash
   chmod +x scripts/install_dependencies.sh
   ```

3. Run the installation script:
   ```bash
   sudo ./scripts/install_dependencies.sh
   ```

4. Start Minikube:
   ```bash
   chmod +x setup_minikube.sh && sudo ./setup_minikube.sh
   ```



## Cleanup Instructions

1. CD into any of the project directories and run:
   ```bash
   cd <project-directory>>
   make delete
   ```
