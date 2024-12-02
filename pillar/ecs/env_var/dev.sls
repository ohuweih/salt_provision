ecsClusters:
  - clusterName: gaies-pe-dev-ecs-cluster
    clusterTags: {"Name": "gaies-pe-dev-ecs-cluster", "Environment": "dev", "Manageby": "Salt"}
    ecsTasks:

      - taskDefinition: gaies-pe-dev-ui
        taskTags: {"Name": "gaies-pe-dev-ui", "Environment": "dev", "Manageby": "Salt"}
        serviceName: flask
        containerPort: 443
        hostPort: 443
        image: 'registry.gitlab.com/gadhs/ai-policy-engine/gen-ai-policy-engine-backend:latest'
        logGroup: gaies-pe-dev-ecs-ui
        taskRole: 'arn:aws:iam::613398752565:role/gaies-dev-pe-ecs-taskexecution-role'
        executionRole: 'arn:aws:iam::613398752565:role/gaies-dev-pe-ecs-taskexecution-role'
        envVar: 
          - {"name": "weaviate_hostname","value": "ip-10-146-74-4.ec2.internal"}
          - {"name": "oracle_hostname","value": "ip-10-146-74-134.ec2.internal"}
          - {"name": "oracle_service", "value": "IESPEUT1"}
        credentialsParameter: arn:aws:secretsmanager:us-east-1:613398752565:secret:PolicyEngine/gitlab-ui-7epRaO

    ecsServices:
      - serviceName: frontend
        taskDefinition: gaies-pe-dev-taskDefinition-combined-ALB:9
        clusterName: gaies-pe-dev-ecs-cluster
        targetGroup: gaies-pe-dev-NEWTargetGroup
        containerPort: 443
        minContainers: 1
        maxContainers: 3
        desiredCount: 1
        ecsServiceTags: {"Name": "gaies-pe-dev-", "Environment": "dev", "Manageby": "Salt"}
        subnets:
          - subnet-0c9c6067d938a27cd
          - subnet-01a10c7f987c696ea
        containerSecGrp:
          - sg-007cfa763299cd307