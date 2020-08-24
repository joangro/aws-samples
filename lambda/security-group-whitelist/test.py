import boto3
import json
import pprint


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

def test_func():
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

    my_sg.revoke_ingress(IpPermissions=current_settings)

    my_ip = '54.240.197.234'

    current_settings[0]['IpRanges'][0]['CidrIp'] = my_ip + '/32'

    my_sg.authorize_ingress(IpPermissions=current_settings)

if __name__=='__main__':
    test_func()
