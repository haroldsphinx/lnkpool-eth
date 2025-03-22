BASE_DIR=base
RELEASE_NAME=loki
CHART_NAME=grafana/loki-stack
VERSION=2.10.2
ENVIRONMENT=testnet
NAMESPACE=logging

.PHONY: install-dependencies
install-dependencies:
	helm repo add grafana https://grafana.github.io/helm-charts
	helm repo update

.PHONY: template
template: validate install-dependencies
	rm -rf ${BASE_DIR}/${RELEASE_NAME}
	helm template -n ${NAMESPACE} ${RELEASE_NAME} $(CHART_NAME) --version $(VERSION) --output-dir=./base --debug -f ./values.yaml

.PHONY: deploy
deploy:
	helm upgrade --install -n ${NAMESPACE} $(RELEASE_NAME) $(CHART_NAME) --version $(VERSION)  -f ./values.yaml 
.PHONY: delete
delete: install-dependencies
	helm uninstall -n ${NAMESPACE} $(RELEASE_NAME)

.PHONY: validate
validate:
ifeq (${ENVIRONMENT},)
	$(error ENVIRONMENT is undefined. Should be testnet or mainnet)
endif
