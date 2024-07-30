# Define variables
CHART_NAME=rakbankdemoapp
CHART_VERSION=0.1.0
HELM_PACKAGE=${CHART_NAME}-${CHART_VERSION}.tgz
NAMESPACE=default
RELEASE_NAME=rakbankdemoapp

# Default target
all: package

# Phony targets
.PHONY: all package install upgrade uninstall lint test clean deploy

# Package the Helm chart
package:
	helm package .

# Install the Helm chart
install: package
	helm install ${RELEASE_NAME} ./${HELM_PACKAGE} --namespace ${NAMESPACE}

# Upgrade the Helm release
upgrade: package
	helm upgrade ${RELEASE_NAME} ./${HELM_PACKAGE} --namespace ${NAMESPACE}

# Uninstall the Helm release
uninstall:
	helm uninstall ${RELEASE_NAME} --namespace ${NAMESPACE}

# Lint the Helm chart
lint:
	helm lint .

# Test the Helm chart
test:
	helm test ${RELEASE_NAME} --namespace ${NAMESPACE}

# Clean up the packaged chart
clean:
	rm -f ${HELM_PACKAGE}

# Run all steps (lint, package, install, test)
deploy: lint clean install test
