functions:
  - functionName: gaies-pe-dev-backend-container-gitlab-pipeline
    account: 613398752565
    roleArn: arn:aws:iam::613398752565:role/gaies-dev-pe-lambda-role
    image: '613398752565.dkr.ecr.us-east-1.amazonaws.com/pe-dev/backend-lambda:latest'
    description: gaies-pe-dev-backend-container-gitlab-pipeline
    timeout: 900 #time is in (secs/minutes)
    memorySize: 512 #size in mb
    storageSize: 512
    region: us-east-1
    subnetIds:
      - subnet-0c9c6067d938a27cd
      - subnet-01a10c7f987c696ea
    securityGroupIds:
      - {{ salt['grains.get']('gaies-pe-dev-common-scg-gitlab-pipeline-deploy') }}
      - {{ salt['grains.get']('gaies-pe-dev-ecs-fargate-LoadBalancerSecurityGroup-gitlab-pipeline-deploy') }}
    tags: {"Name": "gaies-pe-dev-backend-container-gitlab-pipeline", "Environment": "Dev", "Project": "gaies-pe", "ManagedBy": "Salt", "DELETETHIS": "True" }