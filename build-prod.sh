#!/bin/bash

jekyll clean --config _config.yml,_config-prod.yml -d docs
jekyll build --config _config.yml,_config-prod.yml -d docs
