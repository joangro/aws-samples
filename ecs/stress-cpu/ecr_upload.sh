#!/bin/bash 
ACCOUNT_ID=914609264432
REGION=eu-west-1

echo "Creating ECR repository with name $1 in region $REGION"
aws ecr create-repository --repository-name $1

