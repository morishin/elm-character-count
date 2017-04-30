#!/usr/bin/env bash
cd "$(dirname "$0" | sed 's/ /\ /g')"
if [ -z "$AWS_ACCESS_KEY_ID" ] || [ -z "$AWS_SECRET_ACCESS_KEY" ] || [ -z "$AWS_DEFAULT_REGION" ] || [ -z "$AWS_S3_BUCKET" ]; then
  echo "Please set the environment variables: AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_DEFAULT_REGION, AWS_S3_BUCKET"
  exit 1
fi
elm-make Main.elm
aws s3 cp ./index.html s3://$AWS_S3_BUCKET/ --acl public-read
