#!/bin/bash
docker image rm titi
docker build . -t titi --no-cache
