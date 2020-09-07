import json
import boto3
from botocore.config import Config

config=Config(region_name = 'us-east-1')

ec2 = boto3.resource('ec2', config=config)

us_al2_ami='ami-02354e95b39ca8dec'

try:
    ec2.create_instances(
            ImageId=us_al2_ami,
            MaxCount=1,
            MinCount=1,
            InstanceType='t3.micro'
            )
except Exception as e:
    print('Exception raised: ' + str(e))

