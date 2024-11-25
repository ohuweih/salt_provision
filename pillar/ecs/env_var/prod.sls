ecsClusters:
  - clusterName: gaies-pe-prod-cluster
    clusterTags: {"Name": "gaies-pe-prod-cluster", "Environment": "prod", "Manageby": "Salt"}
    ecsTasks:
      - taskDefinition: gaies-pe-prod-flask
        taskTags: {"Name": "gaies-pe-prod-flask", "Environment": "prod", "Manageby": "Salt"}
        serviceName: flask
        containerPort: 5000
        hostPort: 5000
        image: 'registry.gitlab.com/gadhs/ai-policy-engine/gen-ai-policy-engine-backend:latest'
        logGroup: gaies-pe-prod-ecs-flask
        taskRole: arn:aws:iam::845537639440:role/gaies-pe-prod-ecs-taskexecution-role
        executionRole: arn:aws:iam::845537639440:role/gaies-pe-prod-ecs-taskexecution-role
        envVar: 
          - {"name": "weaviate_hostname","value": ""}
          - {"name": "oracle_hostname","value": "ip-10-146-75-136.ec2.internal"}
          - {"name": "oracle_service", "value": "IESPEUT1"}
        credentialsParameter: arn:aws:secretsmanager:us-east-1:845537639440:secret:PolicyEngine/gitlab-backend-y3kc1t

      - taskDefinition: gaies-pe-prod-ui
        taskTags: {"Name": "gaies-pe-prod-ui", "Environment": "prod", "Manageby": "Salt"}
        serviceName: ui
        containerPort: 443
        hostPort: 443
        image: 'registry.gitlab.com/gadhs/ai-policy-engine/gen-ai-policy-engine-backend:latest'
        logGroup: gaies-pe-prod-ecs-ui
        taskRole: arn:aws:iam::845537639440:role/gaies-pe-prod-ecs-taskexecution-role
        executionRole: arn:aws:iam::845537639440:role/gaies-pe-prod-ecs-taskexecution-role
        envVar: 
          - {"name": "weaviate_hostname","value": ""}
          - {"name": "oracle_hostname","value": "ip-10-146-75-136.ec2.internal"}
          - {"name": "oracle_service", "value": "IESPEUT1"}
        credentialsParameter: arn:aws:secretsmanager:us-east-1:845537639440:secret:PolicyEngine/gitlab-ui-5PhIAG

    ecsServices:
      - serviceName: flask
        taskDefinition: gaies-pe-prod-flask:1
        clusterName: gaies-pe-prod-cluster
        targetGroup: gaies-pe-prod-flask-targetgroup
        containerPort: 5000
        minContainers: 2
        maxContainers: 4
        desiredCount: 2
        ecsServiceTags: {"Name": "gaies-pe-prod-ecs-flask", "Environment": "prod", "Manageby": "Salt"}
        subnets:
          - subnet-0a3f7d83e051e9605
          - subnet-04300f88d58e0f7de
        containerSecGrp:
          - {{ salt['grains.get']('gaies-pe-prod-ecs-fargate-ContainerSecurityGroup')}}

      - serviceName: ui
        taskDefinition: gaies-pe-prod-ui:1
        clusterName: gaies-pe-prod-cluster
        targetGroup: gaies-pe-prod-targetgroup
        containerPort: 443
        minContainers: 2
        maxContainers: 4 
        desiredCount: 4
        ecsServiceTags: {"Name": "gaies-pe-prod-ecs-ui", "Environment": "prod", "Manageby": "Salt"}
        subnets:
          - subnet-0a3f7d83e051e9605
          - subnet-04300f88d58e0f7de
        containerSecGrp:
          - {{ salt['grains.get']('gaies-pe-prod-ecs-fargate-ContainerSecurityGroup')}}
