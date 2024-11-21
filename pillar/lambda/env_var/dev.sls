functions:
  - functionName: gaies-pe-dev-backend-container-SALT-Finale-Test
    account: 613398752565
    roleName: gaies-dev-pe-lambda-role
    image: '613398752565.dkr.ecr.us-east-1.amazonaws.com/pe-dev/backend-lambda:latest'
    description: gaies-pe-SALT-TESTlambda-function
    timeout: 900 #time is in (secs/minutes)
    memorySize: 512 #size in mb
    storageSize: 512
    region: us-east-1
    subnetIds:
      - subnet-0c9c6067d938a27cd
      - subnet-01a10c7f987c696ea
    securityGroupIds:
      - sg-007cfa763299cd307
    tags: {"Name": "gaies-pe-SALT-TEST-backend-lambda", "Environment": "Dev", "Project": "gaies-pe", "ManagedBy": "Salt", "DELETETHIS": "True" }
  - functionName: gaies-pe-dev-backend-lambda-SALT-Finale-Test
    account: 613398752565
    runtime: python3.12
    handler: index
    roleName: gaies-dev-pe-lambda-role
    description: gaies-pe-SALT-TESTlambda-function
    timeout: 900 #time is in (secs/minutes)
    memorySize: 512 #size in mb
    storageSize: 512
    region: us-east-1
    tags: {"Name": "gaies-pe-SALT-TEST-backend-lambda", "Environment": "Dev", "Project": "gaies-pe", "ManagedBy": "Salt", "DELETETHIS": "True" }