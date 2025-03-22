NAMESPACE := argocd
HELM_REPO_NAME := argo
HELM_REPO_URL := https://argoproj.github.io/argo-helm
RELEASE_NAME := argocd
HELM_CHART := argo/argo-cd

.PHONY: create-namespace install-dependencies install-argocd uninstall-argocd get-admin-password

install-dependencies:
	helm repo add $(HELM_REPO_NAME) $(HELM_REPO_URL)
	helm repo update

deploy: install-dependencies
	helm upgrade --install $(RELEASE_NAME) $(HELM_CHART) \
		--namespace $(NAMESPACE) \
		--set configs.params."server\.insecure"=true \
		--create-namespace \
		--wait

get-admin-password:
	@echo "Admin password:"
	@kubectl -n $(NAMESPACE) get secret argocd-initial-admin-secret \
		-o jsonpath="{.data.password}" | base64 -d; echo

create-project:
	kubectl apply -f project.yml

create-ethereum-project:
	kubectl apply -f applications/ethereum.yml

uninstall-argocd:
	helm uninstall $(RELEASE_NAME) -n $(NAMESPACE)
	kubectl delete namespace $(NAMESPACE)