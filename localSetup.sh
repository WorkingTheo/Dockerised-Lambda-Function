#!/bin/bash

echo "Create lambda function"

awslocal iam create-role \
  --role-name admin \
  --path / \
  --assume-role-policy-document file://admin-policy.json
echo "...above works"

awslocal lambda create-function \
  --function-name test \
  --runtime nodejs18.x \
  --timeout 10 \
  --zip-file fileb://lambdas.zip \
  --handler handler.handler \
  --role arn:aws:iam::000000000000:role/admin

echo "DONE creating lambda function!"

# wait for function to be active
echo "Waiting for function to be active..." 
while true; do 
    status=$(awslocal lambda get-function --function-name test --query 'Configuration.State' --output text)
    if [[ "$status" == "Active" ]]; then
        echo "Lambda function is active."
        break
    fi
    echo "Current status: $status. Waiting..."
    sleep 2
done

echo "------------------------------"

echo "Create function url"
awslocal lambda create-function-url-config \
  --function-name test \
  --auth-type NONE
