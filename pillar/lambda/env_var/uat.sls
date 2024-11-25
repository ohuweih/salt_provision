functions:
  - functionName: gaies-pe-uat-backend-container
    account: 324053739222
    roleArn: arn:aws:iam::324053739222:role/gaies-npd-pe-lambda-role
    image: 324053739222.dkr.ecr.us-east-1.amazonaws.com/pe-uat/backend-lambda:latest
    description: "Back end lambda for pe"
    timeout: 900 #time is in (secs/minutes)
    memorySize: 512 #size in mb
    storageSize: 512
    region: us-east-1
    subnetIds:
      - subnet-069804bbc925145c1
      - subnet-023848e4927027f73
    securityGroupIds:
      - {{ salt['grains.get']('gaies-pe-uat-ecs-fargate-ContainerSecurityGroup') }}
      - {{ salt['grains.get']('gaies-pe-uat-common-scg') }}
    tags: {"Name": "gaies-pe-uat-backend-container", "Environment": "uat", "Project": "gaies-pe", "ManagedBy": "Salt"}