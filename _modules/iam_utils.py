import boto3

def assume_role(roleArn, sessionName="SaltSession"):

    sts_client= boto3.client("sts")
    assumed_role = sts_client.assume_role(RoleArn=roleArn, RoleSessionName=sessionName)
    credentials = assumed_role["Credentials"]

    __salt__['grains.set']('AccessKeyId', credentials["AccessKeyId"])
    __salt__['grains.set']('SecretAccessKey', credentials["SecretAccessKey"])
    __salt__['grains.set']('SessionToken', credentials["SessionToken"])

    print(credentials)
    return {
        "AccessKeyId": credentials["AccessKeyId"],
        "SecretAccessKey": credentials["SecretAccessKey"],
        "SessionToken": credentials["SessionToken"],
    }
