#!/bin/bash
aws cloudformation create-stack \
	--template-body file://2-elb-pkg.yaml \
	--parameters ParameterKey=Subnet,ParameterValue=subnet-2447406c ParameterKey=KeyName,ParameterValue=main-linux \
	--stack-name elb$1
