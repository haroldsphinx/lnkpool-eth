NAMESPACE := ingress-nginx
RELEASE_NAME := ingress-nginx
HELM_CHART := ingress-nginx/ingress-nginx
HELM_REPO_URL := https://kubernetes.github.io/ingress-nginx

.PHONY: install-dependencies

install-dependencies:
	helm repo add ingress-nginx $(HELM_REPO_URL)
	helm repo update

deploy:
	helm upgrade --install $(RELEASE_NAME) $(HELM_CHART) \
		--namespace $(NAMESPACE) \
		--create-namespace \
		-f values.yaml \
		--wait

delete:
	helm uninstall $(RELEASE_NAME) -n $(NAMESPACE)

