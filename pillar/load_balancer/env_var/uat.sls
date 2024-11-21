loadBalancers:
  - loadBalancerName: "gaies-pe-uat-LoadBalancer"
    securityGroups:
      - gaies-pe-uat-ecs-fargate-LoadBalancerSecurityGroup
    subnets:
      - subnet-069804bbc925145c1
      - subnet-023848e4927027f73
    listeners:
    port: 443
    protocol: HTTPS
    certificateArn: arn:aws:acm:us-east-1:324053739222:certificate/c3c9d343-1e54-46cd-895d-bf9b60eda91c
    scheme: internal
    account: 324053739222
    defaultTargetGroup: gaies-pe-uat-flask-targetgroup/3f75751389dc3c9d
    listenerTags:  {"Name": "gaies-pe-uat-LoadBalancer", "Environment": "uat", "ManagedBy": "Salt", "Project": "gaies-pe"}
    loadBalancerTags: {"Name": "gaies-pe-uat-Listener", "Environment": "uat", "ManagedBy": "Salt", "Project": "gaies-pe"}
    rules:
      - name: a
        targetGroupName: gaies-pe-uat-flask-targetgroup/3f75751389dc3c9d
        method:
          - POST
          - OPTIONS
        sticky: True
        priority: 100
        hostHeader:
          - policyuat.tools.gateway.ga.gov
      - name: b
        targetGroupName: gaies-pe-uat-targetgroup/b0faad81c11b0dee
        hostHeader:
          - policyuat.tools.gateway.ga.gov
        sticky: False
        priority: 110
