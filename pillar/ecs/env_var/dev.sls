ecsValues:
  - clusterName: gaies-pe-dev-ecs-cluster-SaltFinale-Test
    region: us-east-1
    subnetA: subnet-0fd6659530eaac52f
    subnetB: subnet-0b43adeda2af5d8dc
    containerSecGrp: "sg-0c2060fbeab24f1b8" ### this can be a list if needs to be ###
    serviceName: gaies-pe-dev-ecs-ui-SaltFinale-Test
    containerPort: 80
    certificate: 'arn:aws:acm:us-east-1:613398752565:certificate/59962212-e932-47bb-8428-1d8bada3f827'
    taskDefinition: gaies-pe-dev-ecs-ui_TaskDefinition-SaltFinale-Test
    resourceId: gaies-pe-dev-ecs-ui-SALT
    minContainers: 0
    maxContainers: 4
    autoScalingRole: 'arn:aws:iam::613398752565:role/gaies-dev-pe-ecs-role'
    policyName: gaies-pe-dev-ecs-ui_AutoScalingPolicy
    autoScalingTargetValue: 50
    taskRole: 'arn:aws:iam::613398752565:role/gaies-dev-pe-ecs-taskexecution-role'
    executionRole: 'arn:aws:iam::613398752565:role/gaies-dev-pe-ecs-taskexecution-role'
    requiresCompatibilities:
      - FARGATE
    image: '613398752565.dkr.ecr.us-east-1.amazonaws.com/pacman:latest'
    logRegion:
    logGroup: /ecs/gaies-pe-dev-ecs-ui_TaskDefinition
    taskTags: {"Name": "gaies-pe-dev-ecs-ui_TaskDefinition-Salt-Test", "Environment": "Dev", "Manageby": "Salt", "Deletethis": "True" }
    ecsServiceTags: {"Name": "gaies-pe-dev-ecs-ui-Salt-Test", "Environment": "Dev", "Manageby": "Salt", "Deletethis": "True" }
    clusterTags: {"Name": "gaies-pe-dev-ecs-cluster-Salt-Test", "Environment": "Dev", "Manageby": "Salt", "Deletethis": "True" }