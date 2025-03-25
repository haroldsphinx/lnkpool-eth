BASE_DIR=base
RELEASE_NAME=promtail
CHART_NAME=grafana/promtail
VERSION=6.16.2
ENVIRONMENT=testnet
NAMESPACE=logging
.PHONY: install-dependencies
install-dependencies:
	helm repo add grafana https://grafana.github.io/helm-charts
	helm repo update

.PHONY: template
template: validate install-dependencies
	rm -rf ${BASE_DIR}/${RELEASE_NAME}
	helm template -n ${NAMESPACE} ${RELEASE_NAME} $(CHART_NAME) --version $(VERSION) --output-dir=./base -f ./values.yaml

.PHONY: deploy
deploy: validate install-dependencies
	helm upgrade --install -n ${NAMESPACE} $(RELEASE_NAME) $(CHART_NAME) --version $(VERSION) -f ./values.yaml
.PHONY: delete
delete: install-dependencies
	helm uninstall -n ${NAMESPACE} $(RELEASE_NAME)

.PHONY: validate
validate:
ifeq (${ENVIRONMENT},)
	$(error ENVIRONMENT is undefined. Should be development, staging or production)
endif