NAME       := go-ci
IMAGE_NAME := renaudhager/go-ci
VERSION    :=$(shell git describe --abbrev=0 --tags --exact-match 2>/dev/null || git rev-parse --short HEAD)

.PHONY: build
build:
	docker build \
	--tag="$(IMAGE_NAME):$(VERSION)" .

.PHONY: tag
tag:
	docker tag "$(IMAGE_NAME):$(VERSION)" "$(IMAGE_NAME):$(DRONE_BRANCH)"

.PHONY: tag_release
tag_release:
	docker tag "$(IMAGE_NAME):$(VERSION)" "$(IMAGE_NAME):$(DRONE_TAG)"

.PHONY: publish
publish:
	docker push "$(IMAGE_NAME):$(VERSION)"
	docker push "$(IMAGE_NAME):$(DRONE_BRANCH)"

.PHONY: publish_release
publish_release:
	docker push "$(IMAGE_NAME):$(DRONE_TAG)"
