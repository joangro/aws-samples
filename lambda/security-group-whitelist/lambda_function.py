import json
import pprint

import boto3
from botocore.config import Config

base_config = Config(
	region_name = 'eu-west-1',
#	signature_version = 'v4',
#    retries = {
#        'max_attempts': 5,
#        'mode': 'standard'
#    }
)

my_sg_name = 'SSHFromHome'

def lambda_handler(event, context):
    # TODO implement
    pprint.pprint(event)
    response = {
		"statusCode": 200,
		"statusDescription": "200 OK",
		"isBase64Encoded": False,
		"headers": {
			"Content-Type": "application/json"
	    }
	}
	
    response['body'] = json.dumps(event)

    client = boto3.client('ec2', config=base_config)

    sg_list = client.describe_security_groups()

    #pprint.pprint(sg_list)

    ssh_group = [x for x in sg_list['SecurityGroups'] if x['GroupName'] == my_sg_name]

    pprint.pprint(ssh_group)

    current_settings = ssh_group[0]['IpPermissions']

    pprint.pprint(current_settings)

    group_id = ssh_group[0]['GroupId']

    print(group_id)

    ec2 = boto3.resource('ec2', config=base_config)

    my_sg = ec2.SecurityGroup(group_id)
    
    try:
        my_sg.revoke_ingress(IpPermissions=current_settings)
    except:
        print ("No current rules found")

    my_ip = event['headers']['x-forwarded-for']

    #current_settings[0]['IpRanges'][0]['CidrIp'] = my_ip + '/32'
    
    new_settings=[{'FromPort': 22,
    'IpProtocol': 'tcp',
    'IpRanges': [{'CidrIp': my_ip +'/32'}],
    'Ipv6Ranges': [],
    'PrefixListIds': [],
    'ToPort': 22,
    'UserIdGroupPairs': []}]

    my_sg.authorize_ingress(IpPermissions=new_settings)
    
    
    return response

