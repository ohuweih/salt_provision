import boto3

def createLogGroup(logGroupName, region='us-east-1'):
    client = boto3.client('logs', region_name=region)
    response = client.create_log_group(
        logGroupName=logGroupName
    )