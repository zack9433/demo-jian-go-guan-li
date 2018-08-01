#!/bin/bash

LATEST_TAG=$(git describe --abbrev=0)

yarn version ${LATEST_TAG}
