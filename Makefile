
BRANCH := $(shell git rev-parse --abbrev-ref HEAD)
COMMIT := $(shell git rev-parse --short HEAD)

.PHONY: build
build :
	@echo "Building the image...."
	docker build --no-cache -t krol/demo-trivy:${BRANCH}-${COMMIT} -f Dockerfile .
	@echo "Done!"

scan-image :
	@echo "Run the scanner...."
	trivy image --severity HIGH,CRITICAL krol/demo-trivy:${BRANCH}-${COMMIT}
	@echo "Done!"

missconf-k8s-custom-rego:
	@echo "Custom Rego rules with Trivy...."
	trivy --debug conf --severity CRITICAL --policy ./policy/k8s --namespaces myk8s .

missconf-docker-custom-rego:
	@echo "Nodejs Docker rules with Trivy and OPA...."
	trivy --debug conf --severity CRITICAL --policy ./policy/container --namespaces mycontainer .
