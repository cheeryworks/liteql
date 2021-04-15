#!/bin/bash

bundle exec jekyll clean --config _config.yml,_config-prod.yml -d docs
bundle exec jekyll build --config _config.yml,_config-prod.yml -d docs
