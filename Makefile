# Created By Luis Enrique Fuentes Plata

SHELL = /bin/bash

include .env

.DEFAULT_GOAL := help

.PHONY: run
run: ## (Local): Test locally
	@ docker-compose up -d --build

.PHONY: clean
clean: ## (Local): Clean Docker
	@ docker-compose down -v --rmi all

help:
	@ echo "Please use \`make <target>' where <target> is one of"
	@ perl -nle'print $& if m{^[a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m  %-25s\033[0m %s\n", $$1, $$2}'
