#!/bin/bash

hugo

aws s3 sync --region eu-central-1 --delete ./public/ s3://domen.ipavec.net/
