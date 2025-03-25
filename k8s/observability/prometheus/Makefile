BASE_DIR=base
RELEASE_NAME=prometheus
CHART_NAME=prometheus-community/kube-prometheus-stack
ENVIRONMENT=
NAMESPACE=monitoring
.PHONY: install-dependencies
install-dependencies:
	helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
	helm repo update

.PHONY: template
template: validate install-dependencies
	rm -rf ${BASE_DIR}/${RELEASE_NAME}
	helm template -n ${NAMESPACE} ${RELEASE_NAME} $(CHART_NAME) --output-dir=./base -f ./values.yaml

.PHONY: deploy
deploy:
	helm upgrade --install -n ${NAMESPACE} $(RELEASE_NAME) $(CHART_NAME)  -f ./values.yaml 
.PHONY: delete
delete: install-dependencies
	helm uninstall -n ${NAMESPACE} $(RELEASE_NAME)

.PHONY: validate
validate:
ifeq (${ENVIRONMENT},)
	$(error ENVIRONMENT is undefined. Should be development, staging or production)
endif
