NAMESPACE := ingress-nginx
RELEASE_NAME := ingress-nginx
HELM_CHART := ingress-nginx/ingress-nginx

.PHONY: install-dependencies

install-dependencies:
	helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
	helm repo update

deploy: install-dependencies
	helm upgrade --install $(RELEASE_NAME) $(HELM_CHART) \
		--namespace $(NAMESPACE) \
		--create-namespace \
		-f values.yaml \
		--wait

minikube-install-ingress:
	minikube addons enable ingress
    minikube tunnel

minikube-delete-ingress:
	minikube addons disable ingress

minikube-ingress-ip:
	minikube service ingress-nginx-controller --url

delete:
	helm uninstall $(RELEASE_NAME) -n $(NAMESPACE)

