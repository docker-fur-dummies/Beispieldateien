#!/bin/bash

curl -L -s 'https://registry.hub.docker.com/v2/repositories/library/$1/tags?page_size=1024'|jq '."results"[]["name"]'