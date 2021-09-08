#!/usr/bin/env bash

git clean -xfd
echo "i am here"
env
mvn -B -DskipTests clean package
