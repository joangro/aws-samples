#!/bin/bash
aws cloudformation create-stack --template-body file://2-elb-waitcondition.yaml --parameters ParameterKey=Subnet,ParameterValue=subnet-00a89f2ed4c8fc283 ParameterKey=KeyName,ParameterValue=main-linux --stack-name wait6
