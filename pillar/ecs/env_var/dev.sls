ecsClusters:
  - clusterName: gaies-pe-dev-gitlab-cluster
    clusterTags: {"Name": "gaies-pe-dev-gitlab-cluster", "Environment": "dev", "Manageby": "Salt"}
    ecsTasks:
      - taskDefinition: gaies-pe-dev-flask-gitlab
        taskTags: {"Name": "gaies-pe-dev-flask-gitlab", "Environment": "dev", "Manageby": "Salt"}
        serviceName: flask
        containerPort: 5000
        hostPort: 5000
        image: 'registry.gitlab.com/gadhs/ai-policy-engine/gen-ai-policy-engine-backend:latest'
        logGroup: gaies-pe-dev-ecs-flask-gitlab
        taskRole: 'arn:aws:iam::613398752565:role/gaies-dev-pe-ecs-taskexecution-role'
        executionRole: 'arn:aws:iam::613398752565:role/gaies-dev-pe-ecs-taskexecution-role'
        envVar: 
          - {"name": "weaviate_hostname","value": "ip-10-146-74-4.ec2.internal"}
          - {"name": "oracle_hostname","value": "ip-10-146-74-134.ec2.internal"}
          - {"name": "oracle_service", "value": "IESPEUT1"}
        credentialsParameter: arn:aws:secretsmanager:us-east-1:613398752565:secret:PolicyEngine/gitlab-backend-FfvpBL

      - taskDefinition: gaies-pe-dev-ui-gitlab
        taskTags: {"Name": "gaies-pe-dev-ui-gitlab", "Environment": "dev", "Manageby": "Salt"}
        serviceName: flask
        containerPort: 443
        hostPort: 443
        image: 'registry.gitlab.com/gadhs/ai-policy-engine/gen-ai-policy-engine-backend:latest'
        logGroup: gaies-pe-dev-ecs-ui-gitlab
        taskRole: 'arn:aws:iam::613398752565:role/gaies-dev-pe-ecs-taskexecution-role'
        executionRole: 'arn:aws:iam::613398752565:role/gaies-dev-pe-ecs-taskexecution-role'
        envVar: 
          - {"name": "weaviate_hostname","value": "ip-10-146-74-4.ec2.internal"}
          - {"name": "oracle_hostname","value": "ip-10-146-74-134.ec2.internal"}
          - {"name": "oracle_service", "value": "IESPEUT1"}
        credentialsParameter: arn:aws:secretsmanager:us-east-1:613398752565:secret:PolicyEngine/gitlab-ui-7epRaO

    ecsServices:
      - serviceName: flask
        taskDefinition: gaies-pe-dev-flask-gitlab:1
        clusterName: gaies-pe-dev-gitlab-cluster
        targetGroup: gaies-pe-flask-gitlab-pl
        containerPort: 5000
        minContainers: 2
        maxContainers: 4
        desiredCount: 2
        ecsServiceTags: {"Name": "gaies-pe-dev-ecs-ui-gitlab", "Environment": "dev", "Manageby": "Salt"}
        subnets:
          - subnet-0c9c6067d938a27cd
          - subnet-01a10c7f987c696ea
        containerSecGrp:
          - {{ salt['grains.get']('gaies-pe-dev-ecs-fargate-ContainerSecurityGroup-gitlab-pipeline-deploy')}}

      - serviceName: ui
        taskDefinition: gaies-pe-dev-ui-gitlab:1
        clusterName: gaies-pe-dev-gitlab-cluster
        targetGroup: gaies-pe-gitlab-pl
        containerPort: 443
        minContainers: 2
        maxContainers: 4 
        desiredCount: 4
        ecsServiceTags: {"Name": "gaies-pe-dev-ecs-ui-gitlab", "Environment": "dev", "Manageby": "Salt"}
        subnets:
          - subnet-0c9c6067d938a27cd
          - subnet-01a10c7f987c696ea
        containerSecGrp:
          - {{ salt['grains.get']('gaies-pe-dev-ecs-fargate-ContainerSecurityGroup-gitlab-pipeline-deploy')}}
