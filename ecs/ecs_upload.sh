#!/bin/bash 
ACCOUNT=914609264432
REGION=eu-west-1

# Start by creating the repository
out=$(aws ecr create-repository --repository-name $1 --region $REGION)
echo "$out" | grep RepositoryAlreadyExistsException > /dev/null 2>&1 
if [ $? == 1 ];then
	echo "Repository already exists, skipping..."
fi

# Auth in docker
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ACCOUNT.dkr.ecr.$REGION.amazonaws.com

# Tag input image
docker tag $1 $ACCOUNT.dkr.ecr.$REGION.amazonaws.com/$1

# Push image
docker push $ACCOUNT.dkr.ecr.$REGION.amazonaws.com/$1
