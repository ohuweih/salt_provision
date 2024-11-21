ecsValues:
  - clusterName: gaies-pe-prod-ecs-cluster
    clusterTags: {"Name": "gaies-pe-prod-ecs-cluster", "Environment": "prod", "Manageby": "Salt"}
    ecsTasks:
      taskDefinition: gaies-pe-prod-flask
      taskTags: {"Name": "gaies-pe-prod-flask_TaskDefinition", "Environment": "prod", "Manageby": "Salt"}
      serviceName: flask
      containerPort: 5000
      hostPort: 5000
      image: 'registry.gitlab.com/gadhs/ai-policy-engine/gen-ai-policy-engine-backend:latest'
      logGroup: gaies-pe-prod-ecs-flask
      taskRole: 'arn:aws:iam::845537639440:role/gaies-prod-pe-ecs-taskexecution-role'
      executionRole: 'arn:aws:iam::845537639440:role/gaies-prod-pe-ecs-taskexecution-role'
      envVar: 
        - {"name": "weaviate_hostname","value": "ip-10-146-74-4.ec2.internal"}
        - {"name": "oracle_hostname","value": "ip-10-146-74-134.ec2.internal"}
        - {"name": "oracle_service", "value": "IESPEUT1"}
      credentialsParameter: ##
    ecsServices:
      serviceName: flask
      taskDefinition: gaies-pe-prod-flask
      clusterName: gaies-pe-prod-ecs-cluster
      targetGroup: arn:aws:elasticloadbalancing:us-east-1:324053739222:targetgroup/gaies-pe-prod-flask-targetgroup/##
      containerPort: 5000
      resourceId: gaies-pe-prod-ecs-backed
      minContainers: 2
      maxContainers: 4
      ecsServiceTags: {"Name": "gaies-pe-prod-ecs-ui", "Environment": "prod", "Manageby": "Salt"}
      subnetA: subnet-0a3f7d83e051e9605
      subnetB: subnet-04300f88d58e0f7de
      containerSecGrp: ##


      autoScalingRole: ##
      policyName: gaies-pe-prod-ecs-ui_AutoScalingPolicy
      autoScalingTargetValue: 50
