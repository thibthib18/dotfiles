#!/bin/bash

#docker build -t dev_thib .
docker build -t dev_thib --build-arg user=thib --build-arg BASE_IMAGE=thib_base:latest .
