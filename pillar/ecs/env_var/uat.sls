ecsClusters:
  - clusterName: gaies-pe-uat-cluster
    clusterTags: {"Name": "gaies-pe-uat-cluster", "Environment": "uat", "Manageby": "Salt"}
    ecsTasks:
      - taskDefinition: gaies-pe-uat-flask
        taskTags: {"Name": "gaies-pe-uat-flask", "Environment": "uat", "Manageby": "Salt"}
        serviceName: flask
        containerPort: 5000
        hostPort: 5000
        image: 'registry.gitlab.com/gadhs/ai-policy-engine/gen-ai-policy-engine-backend:latest'
        logGroup: gaies-pe-uat-ecs-flask
        taskRole: 'arn:aws:iam::324053739222:role/gaies-uat-pe-ecs-taskexecution-role'
        executionRole: 'arn:aws:iam::324053739222:role/gaies-uat-pe-ecs-taskexecution-role'
        envVar: 
          - {"name": "weaviate_hostname","value": "ip-10-146-74-13.ec2.internal"}
          - {"name": "oracle_hostname","value": "ip-10-146-74-134.ec2.internal"}
          - {"name": "oracle_service", "value": "IESPEUT1"}
        credentialsParameter: arn:aws:secretsmanager:us-east-1:324053739222:secret:PolicyEngine/gitlab-backend-9kV24N

      - taskDefinition: gaies-pe-uat-ui
        taskTags: {"Name": "gaies-pe-uat-ui", "Environment": "uat", "Manageby": "Salt"}
        serviceName: ui
        containerPort: 443
        hostPort: 443
        image: 'registry.gitlab.com/gadhs/ai-policy-engine/gen-ai-policy-engine-backend:latest'
        logGroup: gaies-pe-uat-ecs-ui
        taskRole: 'arn:aws:iam::324053739222:role/gaies-uat-pe-ecs-taskexecution-role'
        executionRole: 'arn:aws:iam::324053739222:role/gaies-uat-pe-ecs-taskexecution-role'
        envVar: 
          - {"name": "weaviate_hostname","value": "ip-10-146-74-13.ec2.internal"}
          - {"name": "oracle_hostname","value": "ip-10-146-74-134.ec2.internal"}
          - {"name": "oracle_service", "value": "IESPEUT1"}
        credentialsParameter: arn:aws:secretsmanager:us-east-1:324053739222:secret:PolicyEngine/gitlab-ui-P2IAOK

    ecsServices:
      - serviceName: flask
        taskDefinition: gaies-pe-uat-flask:23
        clusterName: gaies-pe-uat-cluster
        targetGroup: gaies-pe-uat-flask-targetgroup
        containerPort: 5000
        minContainers: 2
        maxContainers: 4
        desiredCount: 2
        ecsServiceTags: {"Name": "gaies-pe-uat-ecs-flask", "Environment": "uat", "Manageby": "Salt"}
        subnets:
          - subnet-069804bbc925145c1
          - subnet-023848e4927027f73
        containerSecGrp:
          - {{ salt['grains.get']('gaies-pe-uat-ecs-fargate-ContainerSecurityGroup')}}

      - serviceName: ui
        taskDefinition: gaies-pe-uat-ui:2
        clusterName: gaies-pe-uat-cluster
        targetGroup: gaies-pe-uat-targetgroup
        containerPort: 443
        minContainers: 2
        maxContainers: 4 
        desiredCount: 4
        ecsServiceTags: {"Name": "gaies-pe-uat-ecs-ui", "Environment": "uat", "Manageby": "Salt"}
        subnets:
          - subnet-069804bbc925145c1
          - subnet-023848e4927027f73
        containerSecGrp:
          - {{ salt['grains.get']('gaies-pe-uat-ecs-fargate-ContainerSecurityGroup')}}
