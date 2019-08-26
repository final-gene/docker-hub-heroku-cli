NAME = heroku-cli

default: lint build

.PHONY: lint
lint:
	@docker run --rm -i hadolint/hadolint < Dockerfile

.PHONY: build
build:
	@docker build --tag finalgene/${NAME}:dev ./
	@docker images finalgene/${NAME}:dev

.PHONY: clean
clean:
	-@docker rmi --force $(shell docker images finalgene/${NAME}:dev -q)
