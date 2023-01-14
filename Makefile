.PHONY: build run

build-app := docker-compose build

build:
	$(build-app)

run:
	docker-compose up
