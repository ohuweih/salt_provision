import boto3

def create_efs(creationToken, performanceMode, encrypted, tags, subnetId, ipAddress, securityGroups, backup):
    client = boto3.client('efs', region_name='us-east-1')
    efs = client.create_file_system(
        CreationToken=creationToken,
        PerformanceMode=performanceMode,
        Encrypted=encrypted,
        Backup=backup,
        Tags=tags
    )
    systemId = efs['FileSystemId']
    print(efs)
    __salt__['grains.set'](creationToken, systemId)
    efs_mt = client.create_mount_target(
        FileSystemId=systemId,
        SubnetId=subnetId,
        IpAddress=ipAddress,
        SecurityGroups=securityGroups
    )
    print(efs_mt)