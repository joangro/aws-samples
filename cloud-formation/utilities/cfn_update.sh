#!/bin/bash
#Assuming there is an env variable with the name of the bucket saved
BUCKET=$CFN_BUCKET
echo $BUCKET
BUCKET_PREFIX=$(pwd | sed  -r "s/.*aws\/cloud-formation\///")
aws s3 cp $1 s3://$BUCKET/$BUCKET_PREFIX/$1
