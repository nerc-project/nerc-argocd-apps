#!/bin/bash

APP_OF_APPS=app-of-apps

(cd $APP_OF_APPS && kustomize build > /dev/null || exit 1)
