ecsValues:
  - clusterName: gaies-pe-uat-ecs-cluster
    region: us-east-1
    subnetA: subnet-069804bbc925145c1
    subnetB: subnet-023848e4927027f73
    containerSecGrp: "sg-0227951ee80c73375" ### this can be a list if needs to be ###
    serviceName: flask
    containerPort: 5000
    hostPort: 5000
    targetGroup: arn:aws:elasticloadbalancing:us-east-1:324053739222:targetgroup/gaies-pe-uat-flask-targetgroup/3f75751389dc3c9d
    credentialsParameter: arn:aws:secretsmanager:us-east-1:324053739222:secret:PolicyEngine/gitlab-backend-9kV24N
    taskDefinition: gaies-pe-uat-flask
    resourceId: gaies-pe-uat-ecs-backed
    minContainers: 0
    maxContainers: 4
    autoScalingRole: 'arn:aws:iam::324053739222:role/gaies-npd-pe-ecs-role'
    policyName: gaies-pe-uat-ecs-ui_AutoScalingPolicy
    autoScalingTargetValue: 50
    envVar: 
      - {"name": "weaviate_hostname","value": "ip-10-146-74-4.ec2.internal"}
      - {"name": "oracle_hostname","value": "ip-10-146-74-134.ec2.internal"}
      - {"name": "oracle_service", "value": "IESPEUT1"}
    taskRole: 'arn:aws:iam::324053739222:role/gaies-npd-pe-ecs-taskexecution-role'
    executionRole: 'arn:aws:iam::324053739222:role/gaies-npd-pe-ecs-taskexecution-role'
    requiresCompatibilities:
      - FARGATE
    image: 'registry.gitlab.com/gadhs/ai-policy-engine/gen-ai-policy-engine-backend:latest'
    logRegion:
    logGroup: gaies-pe-uat-ecs-flask
    taskTags: {"Name": "gaies-pe-uat-ecs-ui_TaskDefinition", "Environment": "UAT", "Manageby": "Salt"}
    ecsServiceTags: {"Name": "gaies-pe-uat-ecs-ui", "Environment": "UAT", "Manageby": "Salt"}
    clusterTags: {"Name": "gaies-pe-uat-ecs-cluster", "Environment": "UAT", "Manageby": "Salt"}