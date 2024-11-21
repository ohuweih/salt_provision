functions:
  - functionName: gaies-pe-prod-backend-container
    account: 845537639440
    roleArn: arn:aws:iam::845537639440:role/gaies-npd-pe-lambda-role
    image: 845537639440.dkr.ecr.us-east-1.amazonaws.com/pe-prod/backend-lambda:latest
    description: "Back end lambda for pe"
    timeout: 900 #time is in (secs/minutes)
    memorySize: 512 #size in mb
    storageSize: 512
    region: us-east-1
    subnetIds:
      - subnet-0a3f7d83e051e9605
      - subnet-04300f88d58e0f7de
    securityGroupIds:
      - sg-054ab897d69030fea
    tags: {"Name": "gaies-pe-prod-backend-container", "Environment": "prod", "Project": "gaies-pe", "ManagedBy": "Salt"}