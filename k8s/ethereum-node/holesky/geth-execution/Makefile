BASE_DIR=base
RELEASE_NAME=geth
CHART_NAME=geth
VERSION=1.0.0	
NAMESPACE=geth
VALUES_FILE=geth-testnet.yaml

.PHONY: install-dependencies
install-dependencies:
	helm repo add stakewise https://charts.stakewise.io
	helm repo update

.PHONY: template
template: validate install-dependencies
	rm -rf ${BASE_DIR}/${RELEASE_NAME}
	helm template -n ${NAMESPACE} ${RELEASE_NAME} stakewise/geth --version $(VERSION) --output-dir=./base -f ./$(VALUES_FILE)

.PHONY: deploy
deploy:  install-dependencies
	helm upgrade --install -n ${NAMESPACE} geth geth/geth --version $(VERSION) -f ./$(VALUES_FILE)

.PHONY: delete
delete: install-dependencies
	helm uninstall -n ${NAMESPACE} $(RELEASE_NAME)
