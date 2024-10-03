#!/bin/bash

echo "Create lambda function"

awslocal iam create-role \
  --role-name admin \
  --path / \
  --assume-role-policy-document file://admin-policy.json
echo "...above works"

awslocal lambda create-function \
  --function-name test \
  --runtime nodejs20.x \
  --timeout 10 \
  --zip-file fileb://lambdas.zip \
  --handler handler.handler \
  --role arn:aws:iam::000000000000:role/admin

echo "DONE creating lambda function!"

echo "------------------------------"
# echo "Create function url"
# aws lambda create-function-url-config \
#   --function-name test \
#   --auth-type NONE
